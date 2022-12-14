resource "azurerm_resource_group" "rg" {
  name     = "${var.default-name}-rg"
  location = var.default-location
  tags     = var.default-tags
}