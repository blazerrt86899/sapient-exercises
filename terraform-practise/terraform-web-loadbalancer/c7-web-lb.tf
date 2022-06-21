#This will create our load balancer.

resource "azurerm_lb" "web_lb" {
    name = "${local.resource_name_prefix}-weblb"
    location = azurerm_resource_group.myresourcegroup.location
    resource_group_name = azurerm_resource_group.myresourcegroup.name
    sku = "Standard"
    frontend_ip_configuration {
      name = "web-lb-publicip-1"
      public_ip_address_id = azurerm_public_ip.web_public_ip.id
    }
  
}

#Creating lb backend pool
resource "azurerm_lb_backend_address_pool" "web-lb-backend-address-pool" {
    name = "web-backend"
    loadbalancer_id = azurerm_lb.web_lb.id
  
}

#Health checkup
resource "azurerm_lb_probe" "web_lb_probe" {
    name = "tcp-lb-probe"
    protocol = "Tcp"
    port = 80
    loadbalancer_id = azurerm_lb.web_lb.id
  
}

# Lb rule
resource "azurerm_lb_rule" "web_lb_rule" {
    name = "web-lb-rule1"
    protocol = "Tcp"
    frontend_port = 80
    backend_port = 80
    frontend_ip_configuration_name = azurerm_lb.web_lb.frontend_ip_configuration[0].name
    probe_id = azurerm_lb_probe.web_lb_probe.id
    loadbalancer_id = azurerm_lb.web_lb.id
  
}

#we will assocaite network interface and standard load balancer
resource "azurerm_network_interface_backend_address_pool_association" "network_interface_backend_pool_association" {
    network_interface_id = azurerm_network_interface.web_nic
    ip_configuration_name = azurerm_network_interface.web_nic
    backend_address_pool_id = azurerm_lb_backend_address_pool.web-lb-backend-address-pool.id
  
}