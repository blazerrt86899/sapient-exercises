resource "azurerm_virtual_network" "vnet_storage" {
  name                = "${local.resource_name_prefix}-storage-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.myresourcegroup.location
  resource_group_name = azurerm_resource_group.myresourcegroup.name
}