resource "azurerm_network_security_group" "secGroup" {
  name                = "${var.default-name}-secGroup"
  location            = var.default-location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.default-tags

  security_rule {
    name                       = "ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "secGroup_add" {
  subnet_id                 = azurerm_subnet.poc-subnet.id
  network_security_group_id = azurerm_network_security_group.secGroup.id
}