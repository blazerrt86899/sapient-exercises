resource "azurerm_linux_virtual_machine" "web_linuxvm" {
  name                = "${local.resource_name_prefix}-web-linuxvm-${random_string.rgrandom.id}"
  location            = azurerm_resource_group.myresourcegroup.location
  resource_group_name = azurerm_resource_group.myresourcegroup.name
  computer_name       = "dev-linuxvm1-${random_string.rgrandom.id}"
  size                = "Standard_D2s_v3"
  admin_username      = "romu"
  network_interface_ids = [
    azurerm_network_interface.web_nic.id
  ]

  admin_ssh_key {
    username   = "romu"
    public_key = file("${path.module}/ssh-keys/terraform-azure.pub")

  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "83-gen2"
    version   = "latest"
  }
  custom_data = filebase64("${path.module}/app-script/redhat-webvm-script.sh")

}