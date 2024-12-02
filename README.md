# DevOpsDays01-Vault

> Do not run a Vault dev server in production. This approach starts a Vault server with an in-memory database and runs in an insecure way.

To facilitate the demonstration, only one Git repository organized into folders was used, but in a real environment, the ideal would be for each folder to be a different repository.

| Repository | Description |
| --- | --- |
| [repo1-iac-vault](/repo1-iac-vault/) | The infrastructure code (Terraform) that spins up a HashiCorp Vault container on AWS ECS with Fargate. |
| [repo2-code-myapp-build](/repo2-code-myapp-build/) | The test application code for building and publishing to the container registry (AWS ECR). |
| [repo3-iac-myapp-deploy](/repo3-iac-myapp-deploy/) | The infrastructure code (Terraform) that launches the test application container on AWS ECS with Fargate. |

[GitHub Actions/Workflows](/.github/workflows) Pipelines that automate application build and deployment steps.

```sh
# cria backend S3
aws s3 mb s3://devopsdays-statefiles
aws s3 ls
```

```sh
# inicializar terraform
cd iac-vault/
terraform init -backend-config=environment/dev/backend.tfvars

# exibir o plano de execucao, o que sera alterado
terraform plan -var-file=environment/dev/terraform.tfvars -var hashicorp_dev_root_token=root_pwd

# aplicar
terraform apply -var-file=environment/dev/terraform.tfvars -var hashicorp_dev_root_token=root_pwd

# para destruir o ambiente ao final dos testes
terraform destroy -var-file=environment/dev/terraform.tfvars -var hashicorp_dev_root_token=root_pwd
```

## instalar Vault client ou executar um container com o client
- https://developer.hashicorp.com/vault/tutorials/getting-started/getting-started-install
- docker run --rm -it --entrypoint sh hashicorp/vault:1.18

```sh
# Set Vault environment variables
# This will configure the Vault client to talk to the dev server
export VAULT_ADDR='http://devopsdays-vault-ingress-132772647.us-east-1.elb.amazonaws.com:8200'
export VAULT_TOKEN='root_pwd'
```

```sh
# Enable key/value secrets engine to store secrets if needed
#vault secrets enable -path=secret -version=2 kv

vault kv put \
  -mount secret \
  pipelines/myapp/dev \
  DB_USER="user" DB_PASS="pass" DB_HOST="mydb-host.local" ADMIN_EMAIL="admin@devopsdays"

# Enable AppRole auth
vault auth enable approle

# Create a policy for the app
vault policy write app-myapp - << EOF
# MyApp - Read-only permission on secrets
path "secret/data/pipelines/myapp/dev" {
  capabilities = ["read"]
}
EOF

# Creates a role named myapp with app-myapp policy attached
vault write auth/approle/role/myapp \
  token_policies="app-myapp" \
  token_num_uses=5 \
  token_ttl=10m \
  token_max_ttl=20m \
  token_bound_cidrs="10.0.48.0/24","10.0.49.0/24" \
  token_no_default_policy=true \
  secret_id_ttl=10m \
  secret_id_num_uses=1 \
  secret_id_bound_cidrs="10.0.48.0/24","10.0.49.0/24"

# Get RoleID
vault read auth/approle/role/myapp/role-id

# MyApp identity/token - Can get the roles's secret-id
vault policy write approle-myapp-secret - << EOF
# This effectively makes response wrapping mandatory for this path by setting min_wrapping_ttl to 1 second.
# This also sets this path's wrapped response maximum allowed TTL to 90 seconds.
path "auth/approle/role/myapp/secret-id" {
    capabilities = ["update"]
    min_wrapping_ttl = "1s"
    max_wrapping_ttl = "120s"
}
EOF

# Create the identity with access to get the wrapped approle secretid
vault token create -orphan -policy=approle-myapp-secret -no-default-policy -ttl=87600h -display-name=MyAppIdentity


# Retrieve a wrapped SecretID
vault write -wrap-ttl=60s -force -field=wrapping_token auth/approle/role/myapp/secret-id
# Unwrap the SecretID
VAULT_TOKEN="" vault unwrap -field=secret_id

vault write auth/approle/login role_id="" secret_id=""
export APP_TOKEN=""
VAULT_TOKEN=$APP_TOKEN vault kv get secret/pipelines/myapp/dev
```