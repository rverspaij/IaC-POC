variable "default-name" {
  type        = string
  description = "Fill in your project name, this name will be used when making resources."
}

variable "username" {
  description = "Fill in your username to login on your servers"
  type = string
  sensitive = true
}

variable "password" {
  description = "Fill in your password to login on your servers"
  type = string
  sensitive = true
}

variable "default-location" {
  default = "westeurope"
}

variable "default-tags" {
  default = {
    Environment = "Terraform POC"
    Team        = "DevOps"
  }
}