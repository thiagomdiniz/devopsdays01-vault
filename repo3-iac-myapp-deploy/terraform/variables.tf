variable "region" {
  type        = string
  description = "AWS Region where resources will be provisioned."
}

variable "cluster_name" {
  type        = string
  description = "Name of the ECS cluster that will host the service."
}

variable "service_name" {
  type        = string
  description = "Name of the service that will be used within the cluster."
}

variable "service_port" {
  type        = number
  description = "TCP port on which the service will accept traffic."
}

variable "service_cpu" {
  type        = number
  description = "Amount of CPU reserved for the service, in units defined by AWS."
}

variable "service_memory" {
  type        = number
  description = "Amount of memory reserved for the service, in megabytes."
}

variable "service_task_count" {
  type        = number
  description = "Number of tasks the service should keep running simultaneously."
}

variable "container_image" {
  type        = string
  description = "Image with tag for application deployment in ECS."
}

variable "lb_listener_port" {
  type        = number
  description = "TCP port on which the service will accept traffic."
}

variable "ssm_vpc_id" {
  type        = string
  description = "VPC ID stored in AWS Systems Manager (SSM) where the service will be deployed."
}

variable "ssm_private_subnet_1" {
  type        = string
  description = "ID of the first private subnet, stored in AWS SSM, where the service will be deployed."
}

variable "ssm_private_subnet_2" {
  type        = string
  description = "ID of the second private subnet, stored in AWS SSM, for deploying the service."
}

variable "ssm_alb" {
  type = string
  description = "Load balancer ID stored in SSM, used to configure listener"
}