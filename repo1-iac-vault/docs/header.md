# devopsdays-repo1-iac-vault

> Repository that builds AWS infrastructure to run serverless containers (ECS + Fargate).

## Terraform

Set `terraform` variables in [these files](/repo1-iac-vault/environment/dev/).  
Example of using `terraform` referencing `.tfvars` files:

```sh
# initialize terraform
terraform init -backend-config=environment/dev/backend.tfvars

# display the execution plan, what will be changed
terraform plan -var-file=environment/dev/terraform.tfvars
```