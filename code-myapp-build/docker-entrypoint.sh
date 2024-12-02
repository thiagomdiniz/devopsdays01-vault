#!/bin/bash

bucket="myapp-secret"
secret_file="secret.txt"
env_file="/mnt/efs/.env"

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
      # delete secret file
      aws s3 rm s3://${bucket}/${secret_file}

      echo "Vault secret received. Applying..."
      cat $secret_file

      done=1

    fi

    unset EXIST
    sleep 5

  done
}

start_app () {
  exec fastapi run app/main.py --port 8080
}

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

cat $env_file
start_app