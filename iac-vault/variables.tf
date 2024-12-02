variable "project_name" {
  type        = string
  description = "Nome do projeto. Utilizado como prefixo para os recursos criados dentro desse projeto."
}

variable "aws_region" {
  type        = string
  description = "Região da AWS onde os recursos serão criados."
}

variable "fargate_capacity_providers" {
  type        = list(string)
  description = "A lista dos capacity providers que serão permitidos no cluster Fargate."
  default = [
    "FARGATE", "FARGATE_SPOT"
  ]
}

variable "load_balancer_internal" {
  description = "Define se o Load Balancer deve ser interno (true) ou externo (false)."
  type        = bool
  default     = false
}

variable "load_balancer_type" {
  description = "O tipo de Load Balancer a ser criado (ex: 'application' ou 'network')."
  type        = string
  default     = "application"
}

variable "hashicorp_vault_container_image" {
  description = "value"
  type        = string
  default     = "hashicorp/vault:latest"
}

variable "hashicorp_dev_root_token" {
  description = "value"
  type        = string
}