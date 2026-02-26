# 1. web-subnet
resource "azurerm_subnet" "websubnet" {
  name                 = var.websubnet_name
  resource_group_name  = var.resourcegroup_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.websubnet_address_space
  #epends_on = [ azurerm_virtual_network.vnet ]
}


# 2. network security group (nsg)
resource "azurerm_network_security_group" "websubnet_nsg" {
  name                = var.websubnet_nsg_name
  location            = var.location
  resource_group_name = var.resourcegroup_name
}

# 3. NSG rules
locals {
  web_inbound_ports_map = {
    "100" : "80",
    "110" : "443",
    "120" : "22"
  }
}

resource "azurerm_network_security_rule" "web_nsg_rule_inbound" {
  for_each                    = local.web_inbound_ports_map
  name                        = "Rule-Port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resourcegroup_name
  network_security_group_name = azurerm_network_security_group.websubnet_nsg.name

}

# 4. associate nsg with websubnet
resource "azurerm_subnet_network_security_group_association" "websubnet_nsg_associate" {
  depends_on                = [azurerm_network_security_rule.web_nsg_rule_inbound]
  network_security_group_id = azurerm_network_security_group.websubnet_nsg.id
  subnet_id                 = azurerm_subnet.websubnet.id
}