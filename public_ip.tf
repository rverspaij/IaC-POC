resource "azurerm_public_ip" "publicip" {
  name                = "${var.default-name}-publicip"
  location            = var.default-location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
}