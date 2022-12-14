#Configure Azure Provider.
terraform{
required_providers {
  azurerm = {
    source = "hashicorp/azurerm"
    version = "~> 3.0.2"
  }
}
  #Minimal required version.
  required_version = ">= 1.1.0"
}

#Make sure every resource in resource group gets deleted when destory function is called.
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}