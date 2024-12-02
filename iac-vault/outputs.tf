output "ssm_vpc_id" {
  description = "ID do VPC armazenado no AWS Systems Manager Parameter Store. Utilizado para identificar o VPC onde os recursos serão provisionados."
  value       = aws_ssm_parameter.vpc.id
}

output "ssm_subnet_private_1a" {
  description = "ID da subnet privada na zona de disponibilidade 1a. Armazenado no AWS Systems Manager Parameter Store, utilizado para provisionar recursos em uma subnet privada específica."
  value       = aws_ssm_parameter.private_1a.id
}

output "ssm_subnet_private_1b" {
  description = "ID da subnet privada na zona de disponibilidade 1a. Armazenado no AWS Systems Manager Parameter Store, utilizado para provisionar recursos em uma subnet privada específica."
  value       = aws_ssm_parameter.private_1b.id
}

output "ssm_subnet_public_1a" {
  description = "ID da subnet pública na zona de disponibilidade 1a. Armazenado no AWS Systems Manager Parameter Store, é utilizado para provisionar recursos acessíveis publicamente nesta zona."
  value       = aws_ssm_parameter.public_1a.id
}

output "ssm_subnet_public_1b" {
  description = "ID da subnet pública na zona de disponibilidade 1a. Armazenado no AWS Systems Manager Parameter Store, é utilizado para provisionar recursos acessíveis publicamente nesta zona."
  value       = aws_ssm_parameter.public_1b.id
}

output "load_balancer_dns" {
  description = "O nome DNS do Load Balancer criado. Esse valor pode ser usado para acessar o Load Balancer dentro da rede ou pela internet, dependendo da configuração."
  value       = aws_lb.main.dns_name
}

output "ssm_load_balancer_dns" {
  description = "O nome DNS do Load Balancer criado. Esse valor pode ser usado para acessar o Load Balancer dentro da rede ou pela internet, dependendo da configuração."
  value       = aws_ssm_parameter.lb_dns.id
}

output "ssm_lb_arn" {
  description = "O Amazon Resource Name (ARN) do parâmetro do AWS Systems Manager (SSM) que armazena o ARN do Load Balancer. Esse valor pode ser usado para referenciar o ARN do Load Balancer em políticas de IAM, regras de segurança, ou em qualquer outro lugar que requeira o ARN do Load Balancer."
  value       = aws_ssm_parameter.lb_arn.id
}

# output "lb_ssm_listener" {
#   description = "O ID do parâmetro do AWS Systems Manager (SSM) que armazena o Listener do Load Balancer. Esse valor pode ser utilizado para referenciar o Listener em automações, scripts, ou dentro de outras configurações da AWS que necessitem do ID do Listener."
#   value       = aws_ssm_parameter.lb_listener.id
# }