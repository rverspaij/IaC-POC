resource "azurerm_resource_group" "rg" {
  name     = var.default-resourcegroup
  location = var.default-location
  tags     = var.default-tags
}

resource "azurerm_virtual_network" "poc-vnet" {
  name                = "${var.default-name}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.default-location
  resource_group_name = var.default-resourcegroup
}

resource "azurerm_subnet" "poc-subnet" {
  name                 = "${var.default-name}-subnet"
  resource_group_name  = var.default-resourcegroup
  virtual_network_name = azurerm_virtual_network.poc-vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "poc-nic" {
  name                = "${var.default-name}-nic"
  location            = var.default-location
  resource_group_name = var.default-resourcegroup

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.poc-subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}