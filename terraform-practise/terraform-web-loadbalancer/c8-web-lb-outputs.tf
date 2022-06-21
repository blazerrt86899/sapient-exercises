output "web_lb_public_ip_address" {
  description = "Load Balancer Ip address"
  value = azurerm_public_ip.web_public_ip.ip_address
}