resource "azurerm_virtual_network" "rg_vnet" {
  name                = "${local.resource_name_prefix}-${var.vnet_name}-${random_string.rgrandom.id}"
  resource_group_name = azurerm_resource_group.myresourcegroup.name
  location            = var.resource_group_location
  address_space       = var.vnet_address_space
  tags                = local.common_tags
}