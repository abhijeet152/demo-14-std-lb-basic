# network interface.data 
resource "azurerm_network_interface" "web_linuxvm_nic" {
  name                = var.web_linuxvm_nic_name
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = "web-linuxvm-ip-1"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    # public_ip_address_id          = azurerm_public_ip.web_linuxvm_publicip.id
  }
}