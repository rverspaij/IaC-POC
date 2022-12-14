variable "default-name" {
  type        = string
  description = "Fill in your project name, this name will be used when making resources."
}

variable "default-location" {
  default = "westeurope"
}

variable "default-resourcegroup" {
  default = "POC-rg"
}

variable "default-tags" {
  default = {
    Environment = "Terraform POC"
    Team        = "DevOps"
  }
}