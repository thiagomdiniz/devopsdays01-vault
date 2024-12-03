# devopsdays-repo1-iac-vault

> Repository that deploys the app and makes the wrapped secret_id available to the app.

## Terraform

Set `terraform` variables in [these files](/repo3-iac-myapp-deploy/terraform/environment/dev/).  
Example of using `terraform` referencing `.tfvars` files:

```sh
# initialize terraform
terraform init -backend-config=environment/dev/backend.tfvars

# display the execution plan, what will be changed
terraform plan -var-file=environment/dev/terraform.tfvars
```