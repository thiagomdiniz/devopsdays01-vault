output "ssm_vpc_id" {
  description = "VPC ID stored in AWS Systems Manager Parameter Store. Used to identify the VPC where resources will be provisioned."
  value       = aws_ssm_parameter.vpc.id
}

output "ssm_subnet_private_1a" {
  description = "Private subnet ID in Availability Zone 1a. Stored in AWS Systems Manager Parameter Store, used to provision resources in a specific private subnet."
  value       = aws_ssm_parameter.private_1a.id
}

output "ssm_subnet_private_1b" {
  description = "Private subnet ID in Availability Zone 1b. Stored in AWS Systems Manager Parameter Store, used to provision resources in a specific private subnet."
  value       = aws_ssm_parameter.private_1b.id
}

output "ssm_subnet_public_1a" {
  description = "Public subnet ID in Availability Zone 1a. Stored in AWS Systems Manager Parameter Store, it is used to provision publicly accessible resources in this zone."
  value       = aws_ssm_parameter.public_1a.id
}

output "ssm_subnet_public_1b" {
  description = "Public subnet ID in Availability Zone 1b. Stored in AWS Systems Manager Parameter Store, it is used to provision publicly accessible resources in this zone."
  value       = aws_ssm_parameter.public_1b.id
}

output "load_balancer_dns" {
  description = "The DNS name of the created Load Balancer. This value can be used to access the Load Balancer within the network or over the internet, depending on the configuration."
  value       = aws_lb.main.dns_name
}

output "ssm_load_balancer_dns" {
  description = "The DNS name of the Load Balancer, stored in the Parameter Store. This value can be used to access the Load Balancer within the network or over the Internet, depending on the configuration."
  value       = aws_ssm_parameter.lb_dns.id
}

output "ssm_lb_arn" {
  description = "The Amazon Resource Name (ARN) of the AWS Systems Manager (SSM) parameter that stores the Load Balancer ARN. This value can be used to reference the Load Balancer ARN in IAM policies, security rules, or anywhere else that requires the Load Balancer ARN."
  value       = aws_ssm_parameter.lb_arn.id
}