variable "region" {
  type        = string
  description = "Região da AWS onde os recursos serão provisionados."
}

variable "cluster_name" {
  type        = string
  description = "Nome do cluster ECS que hospedará o serviço."
}

variable "service_name" {
  type        = string
  description = "Nome do serviço que será usado dentro do cluster."
}

variable "service_port" {
  type        = number
  description = "Porta TCP na qual o serviço aceitará tráfego."
}

variable "service_cpu" {
  type        = number
  description = "Quantidade de CPU reservada para o serviço, em unidades definidas pela AWS."
}

variable "service_memory" {
  type        = number
  description = "Quantidade de memória reservada para o serviço, em megabytes."
}

variable "service_task_count" {
  type        = number
  description = "Número de tarefas que o serviço deve manter em execução simultaneamente."
}

variable "container_image" {
  type        = string
  description = "Imagem com tag para deployment da aplicação no ECS."
}

variable "lb_listener_port" {
  type        = number
  description = "Porta TCP na qual o serviço aceitará tráfego."
}

variable "ssm_vpc_id" {
  type        = string
  description = "ID do VPC armazenado no AWS Systems Manager (SSM) onde o serviço será implantado."
}

variable "ssm_private_subnet_1" {
  type        = string
  description = "ID da primeira subnet privada, armazenado no AWS SSM, onde o serviço será implantado."
}

variable "ssm_private_subnet_2" {
  type        = string
  description = "ID da segunda subnet privada, armazenado no AWS SSM, para implantação do serviço."
}

variable "ssm_alb" {}