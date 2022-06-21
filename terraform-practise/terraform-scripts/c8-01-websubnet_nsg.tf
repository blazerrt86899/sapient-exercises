resource "azurerm_subnet" "web_subnet" {
  name                 = "${azurerm_virtual_network.rg_vnet.name}-${var.web_subnet_name}"
  resource_group_name  = azurerm_resource_group.myresourcegroup.name
  virtual_network_name = azurerm_virtual_network.rg_vnet.name
  address_prefixes     = var.web_subnet_address_space
}

resource "azurerm_network_security_group" "web_subnet_nsg" {
  name                = "${azurerm_subnet.web_subnet.name}-nsg"
  location            = azurerm_resource_group.myresourcegroup.location
  resource_group_name = azurerm_resource_group.myresourcegroup.name

}

resource "azurerm_subnet_network_security_group_association" "web_subnet_group_association" {
  subnet_id                 = azurerm_subnet.web_subnet.id
  network_security_group_id = azurerm_network_security_group.web_subnet_nsg.id

}

# Network Security Rules
resource "azurerm_network_security_rule" "web_nsg_inbound_security_rules" {
  for_each                    = local.web_inbound_port_rules
  name                        = "Rule-Port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = ""
  destination_port_range      = each.value
  source_address_prefix       = ["20.228.182.219"]
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.myresourcegroup.name
  network_security_group_name = azurerm_network_security_group.web_subnet_nsg.name
}