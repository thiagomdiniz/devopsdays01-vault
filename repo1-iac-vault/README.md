<!-- BEGIN_TF_DOCS -->
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

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.77 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.77.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_alb_target_group.vault](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group) | resource |
| [aws_cloudwatch_log_group.vault](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_ecs_cluster.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_cluster_capacity_providers.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster_capacity_providers) | resource |
| [aws_ecs_service.vault](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.vault](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_eip.vpc_eip_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip.vpc_eip_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_iam_policy_attachment.ecs_task_vault_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_role.ecs_task_vault_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_internet_gateway.gw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_lb.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.vault](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_nat_gateway.nat_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_nat_gateway.nat_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route.private_access_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.private_access_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.public_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.private_internet_access_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.private_internet_access_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public_internet_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.apps](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.vault](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_ssm_parameter.lb_arn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.lb_dns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.private_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.private_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.public_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.public_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_subnet.private_subnet_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private_subnet_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region where the resources will be created. | `string` | n/a | yes |
| <a name="input_fargate_capacity_providers"></a> [fargate\_capacity\_providers](#input\_fargate\_capacity\_providers) | The list of capacity providers that will be allowed on the Fargate cluster. | `list(string)` | <pre>[<br>  "FARGATE",<br>  "FARGATE_SPOT"<br>]</pre> | no |
| <a name="input_hashicorp_dev_root_token"></a> [hashicorp\_dev\_root\_token](#input\_hashicorp\_dev\_root\_token) | The root token (password) to access the Vault | `string` | n/a | yes |
| <a name="input_hashicorp_vault_container_image"></a> [hashicorp\_vault\_container\_image](#input\_hashicorp\_vault\_container\_image) | The container image used to run the HashiCorp Vault dev server. | `string` | `"hashicorp/vault:latest"` | no |
| <a name="input_load_balancer_internal"></a> [load\_balancer\_internal](#input\_load\_balancer\_internal) | Defines whether the Load Balancer should be internal (true) or external (false). | `bool` | `false` | no |
| <a name="input_load_balancer_type"></a> [load\_balancer\_type](#input\_load\_balancer\_type) | The type of Load Balancer to be created (e.g. 'application' or 'network'). | `string` | `"application"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name. Used as a prefix for resources created within this project. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_load_balancer_dns"></a> [load\_balancer\_dns](#output\_load\_balancer\_dns) | The DNS name of the created Load Balancer. This value can be used to access the Load Balancer within the network or over the internet, depending on the configuration. |
| <a name="output_ssm_lb_arn"></a> [ssm\_lb\_arn](#output\_ssm\_lb\_arn) | The Amazon Resource Name (ARN) of the AWS Systems Manager (SSM) parameter that stores the Load Balancer ARN. This value can be used to reference the Load Balancer ARN in IAM policies, security rules, or anywhere else that requires the Load Balancer ARN. |
| <a name="output_ssm_load_balancer_dns"></a> [ssm\_load\_balancer\_dns](#output\_ssm\_load\_balancer\_dns) | The DNS name of the Load Balancer, stored in the Parameter Store. This value can be used to access the Load Balancer within the network or over the Internet, depending on the configuration. |
| <a name="output_ssm_subnet_private_1a"></a> [ssm\_subnet\_private\_1a](#output\_ssm\_subnet\_private\_1a) | Private subnet ID in Availability Zone 1a. Stored in AWS Systems Manager Parameter Store, used to provision resources in a specific private subnet. |
| <a name="output_ssm_subnet_private_1b"></a> [ssm\_subnet\_private\_1b](#output\_ssm\_subnet\_private\_1b) | Private subnet ID in Availability Zone 1b. Stored in AWS Systems Manager Parameter Store, used to provision resources in a specific private subnet. |
| <a name="output_ssm_subnet_public_1a"></a> [ssm\_subnet\_public\_1a](#output\_ssm\_subnet\_public\_1a) | Public subnet ID in Availability Zone 1a. Stored in AWS Systems Manager Parameter Store, it is used to provision publicly accessible resources in this zone. |
| <a name="output_ssm_subnet_public_1b"></a> [ssm\_subnet\_public\_1b](#output\_ssm\_subnet\_public\_1b) | Public subnet ID in Availability Zone 1b. Stored in AWS Systems Manager Parameter Store, it is used to provision publicly accessible resources in this zone. |
| <a name="output_ssm_vpc_id"></a> [ssm\_vpc\_id](#output\_ssm\_vpc\_id) | VPC ID stored in AWS Systems Manager Parameter Store. Used to identify the VPC where resources will be provisioned. |

## Terraform-Docs

Automatically generated documentation with [terraform-docs](../.terraform-docs.yml)

```sh
# generate terraform documentation based on '.terraform-docs.yml' file configurations
docker run --rm --volume "$(pwd):/terraform-docs" -u $(id -u) quay.io/terraform-docs/terraform-docs:0.18.0 /terraform-docs
```
<!-- END_TF_DOCS -->