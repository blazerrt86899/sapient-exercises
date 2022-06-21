resource "azurerm_storage_account" "storage_account_create" {
  name                = "${local.resource_name_prefix}-${random_string.rgrandom.id}-storage"
  resource_group_name = azurerm_resource_group.myresourcegroup.name

  location                 = azurerm_resource_group.myresourcegroup.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action             = "Deny"
    ip_rules                   = ["100.0.0.1"]
    virtual_network_subnet_ids = [azurerm_subnet.subnet_storage.id]
  }

  tags = local.common_tags
}
