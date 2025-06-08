module "Modules" {
  source              = "./Modules"
  vnet_name           = "my_vnet"
  location            = "East US"
  resource_group_name = "my_resource-group"
  vnet_address        = "10.0.0.0/16"

  tags = {
    environment = "dev"
    project     = "vnet-module"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "dev-linux-vm"
  resource_group_name = "my_resource-group"
  location            = "East US"
  size                = "Standard_B1s"
  admin_username      = "azureuser"

  network_interface_ids = [
    azurerm_network_interface.vm_nic.id,
  ]

  admin_password = "XXXXXXXX"
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
