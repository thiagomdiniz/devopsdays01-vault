resource "aws_ssm_parameter" "vpc" {
  name  = "/${var.project_name}/vpc/vpc_id"
  type  = "String"
  value = aws_vpc.main.id
}

resource "aws_ssm_parameter" "private_1a" {
  name  = "/${var.project_name}/vpc/subnet_private_1a"
  type  = "String"
  value = aws_subnet.private_subnet_1a.id
}

resource "aws_ssm_parameter" "private_1b" {
  name  = "/${var.project_name}/vpc/subnet_private_1b"
  type  = "String"
  value = aws_subnet.private_subnet_1b.id
}

resource "aws_ssm_parameter" "public_1a" {
  name  = "/${var.project_name}/vpc/subnet_public_1a"
  type  = "String"
  value = aws_subnet.public_subnet_1a.id
}

resource "aws_ssm_parameter" "public_1b" {
  name  = "/${var.project_name}/vpc/subnet_public_1b"
  type  = "String"
  value = aws_subnet.public_subnet_1b.id
}

resource "aws_ssm_parameter" "lb_arn" {
  name  = "/${var.project_name}/ecs/lb/arn"
  type  = "String"
  value = aws_lb.main.arn
}

resource "aws_ssm_parameter" "lb_dns" {
  name  = "/${var.project_name}/ecs/lb/dns"
  type  = "String"
  value = aws_lb.main.dns_name
}