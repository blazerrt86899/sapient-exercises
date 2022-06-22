# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "myrg" {
  name = "${local.rg_name}-${random_string.myrandom.id}"
  location = var.resoure_group_location
  tags = local.common_tags
}