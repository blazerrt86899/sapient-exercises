resource "azurerm_virtual_network" "vnet-example1" {
    name = "${local.resource_name_prefix}-${var.vnetname_1}-${random_string.rgrandom.id}"
    resource_group_name = azurerm_resource_group.myresourcegroup.name
    location = azurerm_resource_group.myresourcegroup.location
    address_space = var.vnetaddress_space_1
  
}

resource "azurerm_virtual_network" "vnet-example2" {
    name = "${local.resource_name_prefix}-${var.vnetname_2}-${random_string.rgrandom.id}"
    resource_group_name = azurerm_resource_group.myresourcegroup.name
    location = azurerm_resource_group.myresourcegroup.location
    address_space = var.vnetaddress_space_2
  
}

resource "azurerm_virtual_network_peering" "vnet_peering_1" {
    name = "${local.resource_name_prefix}-vnetpeer1to2"
    resource_group_name = azurerm_resource_group.myresourcegroup.name
    virtual_network_name = azurerm_virtual_network.vnet-example1.name
    remote_virtual_network_id = azurerm_virtual_network.vnet-example2.id
  
}

resource "azurerm_virtual_network_peering" "vnet_peering_2" {
    name = "${local.resource_name_prefix}-vnetpeer2to1"
    resource_group_name = azurerm_resource_group.myresourcegroup.name
    virtual_network_name = azurerm_virtual_network.vnet-example2.name
    remote_virtual_network_id = azurerm_virtual_network.vnet-example1.id
  
}