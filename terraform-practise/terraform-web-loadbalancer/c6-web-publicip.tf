resource "azurerm_public_ip" "web_public_ip" {
    name = "${local.resource_name_prefix}-lbpublic-ip"
    location = azurerm_resource_group.myresourcegroup.location
    resource_group_name = azurerm_resource_group.myresourcegroup.name
    allocation_method = "Static"
    sku = "Standard"
    tags = local.common_tags
  
}
