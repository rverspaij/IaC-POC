resource "azure_rm_linux_virtual_machine" "vm-l2022" {
  name                = "${var.default-name}-l2022"
  resource_group_name = var.default-resourcegroup
  location            = var.default-location
  size                = "Standard_B1ms"
  admin_username      = "Raoul"
  admin_password      = "Password01!"
  network_interface_ids = [
    element(azurerm_network_interface.poc-nic.name.id)
  ]

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

  os_profile_linux_config {
    disable_password_authentication = false
  }
}