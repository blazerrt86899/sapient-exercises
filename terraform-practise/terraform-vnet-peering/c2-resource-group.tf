resource "azurerm_resource_group" "myresourcegroup" {
  name     = "${local.resource_name_prefix}-${var.resource_group_name}-${random_string.rgrandom.id}"
  location = var.resource_group_location
  tags     = local.common_tags
}