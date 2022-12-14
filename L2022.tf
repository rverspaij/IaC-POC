resource "azurerm_linux_virtual_machine" "vm-l2022" {
  name                            = "${var.default-name}-l2022"
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = var.default-location
  size                            = "Standard_B1ms"
  admin_username                  = "Raoul"
  admin_password                  = "Password01!"
  network_interface_ids           = azurerm_network_interface.poc-nic.*.id
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}