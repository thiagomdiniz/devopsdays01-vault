variable "project_name" {
  type        = string
  description = "Project name. Used as a prefix for resources created within this project."
}

variable "aws_region" {
  type        = string
  description = "AWS Region where the resources will be created."
}

variable "fargate_capacity_providers" {
  type        = list(string)
  description = "The list of capacity providers that will be allowed on the Fargate cluster."
  default = [
    "FARGATE", "FARGATE_SPOT"
  ]
}

variable "load_balancer_internal" {
  description = "Defines whether the Load Balancer should be internal (true) or external (false)."
  type        = bool
  default     = false
}

variable "load_balancer_type" {
  description = "The type of Load Balancer to be created (e.g. 'application' or 'network')."
  type        = string
  default     = "application"
}

variable "hashicorp_vault_container_image" {
  description = "The container image used to run the HashiCorp Vault dev server."
  type        = string
  default     = "hashicorp/vault:latest"
}

variable "hashicorp_dev_root_token" {
  description = "The root token (password) to access the Vault"
  type        = string
}