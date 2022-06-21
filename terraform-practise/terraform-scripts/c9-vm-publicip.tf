resource "azurerm_public_ip" "vm_publicip" {
  name                = "${local.resource_name_prefix}-web-linuxvm-publicip"
  location            = azurerm_resource_group.myresourcegroup.location
  resource_group_name = azurerm_resource_group.myresourcegroup.name
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label   = "app1-vm-${random_string.rgrandom.id}"

}