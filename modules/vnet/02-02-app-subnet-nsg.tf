# 1. app subnet
# 2. app subnet nsg
# 3. nsg rules
# 4. associate subnet nsg

# 1. app subnet
resource "azurerm_subnet" "appsubnet" {
  name                 = var.appsubnet_name
  resource_group_name  = var.resourcegroup_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.appsubnet_address_space
  depends_on           = [azurerm_subnet.websubnet]
}

# 2. app subnet nsg
resource "azurerm_network_security_group" "appsubnet_nsg" {
  name                = var.appsubnet_nsg_name
  location            = var.location
  resource_group_name = var.resourcegroup_name
}

# 3. nsg rules
locals {
  app_inbound_ports_map = {
    "100" : "80",
    "110" : "443",
    "120" : "8080",
    "130" : "22"
  }
}

resource "azurerm_network_security_rule" "app_nsg_rule_inbound" {
  for_each                    = local.app_inbound_ports_map
  name                        = "Rule-port-${each.key}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resourcegroup_name
  network_security_group_name = azurerm_network_security_group.appsubnet_nsg.name
}

# 4. associate subnet nsg

resource "azurerm_subnet_network_security_group_association" "appsubnet_nsg_associate" {
  depends_on                = [azurerm_network_security_rule.app_nsg_rule_inbound]
  subnet_id                 = azurerm_subnet.appsubnet.id
  network_security_group_id = azurerm_network_security_group.appsubnet_nsg.id
}