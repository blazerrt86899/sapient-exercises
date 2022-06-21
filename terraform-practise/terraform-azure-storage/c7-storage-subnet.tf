resource "azurerm_subnet" "subnet_storage" {
  name                 = "${azurerm_virtual_network.name}-subnet"
  resource_group_name  = azurerm_resource_group.myresourcegroup.name
  virtual_network_name = azurerm_virtual_network.vnet_storage.name
  address_prefixes     = ["10.0.2.0/24"]
  service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage"]
}