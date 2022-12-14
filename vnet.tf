resource "azurerm_virtual_network" "poc-vnet" {
  name                = "${var.default-name}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.default-location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "poc-subnet" {
  name                 = "${var.default-name}-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.poc-vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "poc-nic" {
  name                = "${var.default-name}-nic"
  location            = var.default-location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.poc-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.publicip.id
  }
}