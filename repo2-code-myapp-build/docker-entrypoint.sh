#!/bin/bash

set -eo pipefail

bucket="myapp-secret"
secret_file="secret.txt"
env_file="/mnt/efs/.env"
vault_addr="<vault_addr>"
vault_path="v1/secret/data/pipelines/myapp/dev"

mount_secrets () {
  # updates env file version
  sed -i -E "s~(^VERSION=)([0-9]+)~\1${VERSION}~" $env_file

  # wait secret file to be created
  done=0
  while [ $done -eq 0 ]; do
    # if secret file exists
    aws s3api head-object --bucket $bucket --key $secret_file && EXIST=true
    if [ $EXIST ]; then
      # copy secret file
      aws s3 cp s3://${bucket}/${secret_file} .

      echo "Vault secret received."
      echo "Getting wrapped token from file..."
      wrap_token=$(cat $secret_file)
      echo "Unwrapping the token..."
      secret_id=$(curl -k --fail-with-body --silent --header "X-Vault-Token: $wrap_token" --request POST ${vault_addr}v1/sys/wrapping/unwrap | jq -r ".data.secret_id")
      echo "Authenticating with RoleID + SecretID..."
      app_token=$(curl -k --fail-with-body --silent --request POST --data '{"role_id": "'${ROLE_ID}'", "secret_id": "'${secret_id}'"}' ${vault_addr}v1/auth/approle/login | jq -r ".auth.client_token")
      echo "Getting app secrets..."
      data=$(curl -k --fail-with-body --silent --header "X-Vault-Token: $app_token" ${vault_addr}${vault_path} | jq -r ".data.data")

      # set/overwrite specific app configuration parameters based on vault data
      for key in $(echo $data |jq -r 'keys[]');
      do
          echo -e "\nSetting variable: ${key}..."
          value=$(echo $data | jq -r ".${key}")
          sed -i -E "s#(^${KEY}=\"?)(.*[^\"])?(\"?)#\1${value}\3#" ${env_file}
      done

      # delete secret file
      aws s3 rm s3://${bucket}/${secret_file}

      done=1

    fi

    unset EXIST
    sleep 5

  done
}

start_app () {
  exec fastapi run app/main.py --port 8080 --proxy-headers #--forwarded-allow-ips='10.0.48.0/24,10.0.49.0/24'
}

main () {
  # if env file exists
  if [ -f "$env_file" ]; then
    # get version
    env_file_version=$(cat $env_file |grep VERSION |cut -d'=' -f2)
    current_version="$VERSION"

    # if version differ
    if [[ "$env_file_version" != "$current_version" ]]; then
      echo "Env file exists but version differs. Updating..."
      cp -f .env $env_file
      mount_secrets
    fi

  # if env file not exists
  else
    echo "Env file not exists, creating..."
    cp .env $env_file
    mount_secrets
  fi
}

cat $env_file
main
start_app