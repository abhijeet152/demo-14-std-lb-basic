# Resource-1: Create Public IP Address for Azure Load Balancer
# Resource-2: Create Azure Standard Load Balancer
# Resource-3: Create LB Backend address Pool
# Resource-4: Create LB Probe
# Resource-5: Create LB Rule
# Resource-6: Associate Network Interface(vm) and Standard Load Balancer

###############

# Resource-1: Create Public IP Address for Azure Load Balancer
resource "azurerm_public_ip" "web_lbpublicip" {
  name = var.lb_public_ip_name
  resource_group_name = var.resourcegroup_name
  location = var.location
  allocation_method = "Dynamic"
  sku = "Standard"
}

# Resource-2: Create Azure Standard Load balancer
resource "azurerm_lb" "web_lb" {
  name = var.web_lb_name
  location = var.location
  resource_group_name = var.resourcegroup_name
  sku = "Basic"
  frontend_ip_configuration {
    name = "web-lb-publicip-1"
    public_ip_address_id = azurerm_public_ip.web_lbpublicip.id
  }

}


# Resource-3: Create Lb backend address pool
resource "azurerm_lb_backend_address_pool" "web_lb_backend_address_pool" {
  name = "web-backend"
  loadbalancer_id = azurerm_lb.web_lb.id
}

# Resource-4: Create Lb probe
resource "azurerm_lb_probe" "web_lb-probe" {
  name = "tcp-probe"
  protocol = "Tcp"
  port = 80
  loadbalancer_id = azurerm_lb.web_lb.id
    
}

# Resource-5: Create LB Rule.
resource "azurerm_lb_rule" "web_lb_rule_app1" {
  loadbalancer_id = azurerm_lb.web_lb.id
  name = "web-app1-rule"
  protocol = "Tcp"
  frontend_port = 80
  backend_port = 80
  frontend_ip_configuration_name = azurerm_lb.web_lb.frontend_ip_configuration[0].name
  probe_id = azurerm_lb_probe.web_lb-probe.id

}
  
# Resource-6: Associate Network Interface(vm) and Standard Load Balancer
resource "azurerm_network_interface_backend_address_pool_association" "web_nic_lb_associate" {
  network_interface_id = var.network_interface_id
  ip_configuration_name = var.ip_configuration_name
  backend_address_pool_id = azurerm_lb_backend_address_pool.web_lb_backend_address_pool.id
  
}