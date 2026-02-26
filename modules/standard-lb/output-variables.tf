# lb public ip
output "web_lb_public_ip_address" {
    description = "web load balancer public address"
    value = azurerm_public_ip.web_lbpublicip.ip_address
}

# load balancer id
output "web_lb_id" {
  description = "web load balancer id"
  value = azurerm_lb.web_lb.id
}

# Load balancer frontedn ip configuration block.
output "web_lb_frontend_ip_configuration" {
    description = "web lb frontend ip configuration block"
    value = [azurerm_lb.web_lb.frontend_ip_configuration]
}