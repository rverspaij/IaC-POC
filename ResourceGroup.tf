resource "azurerm_resource_group" "rg" {
  name     = var.default-resourcegroup
  location = var.default-location
  tags     = var.default-tags
}