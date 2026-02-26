# 1. db subnet
# 2. db subnet nsg
# 3. nsg rules
# 4. associate subnet nsg

# 1. db subnet
resource "azurerm_subnet" "dbsubnet" {
  name                 = var.dbsubnet_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.resourcegroup_name
  address_prefixes     = var.dbsubnet_address_space
  depends_on           = [azurerm_subnet.appsubnet]
}

# 2. db subnet nsg
resource "azurerm_network_security_group" "dbsubnet_nsg" {
  name                = var.dbsubnet_nsg_name
  resource_group_name = var.resourcegroup_name
  location            = var.location
}

# 3. nsg rules
locals {
  db_inbound_ports_map = {
    "100" : "3306", # If the key starts with a number, you must use the colon syntax ":" instead of "="
    "110" : "1433",
    "120" : "5432"
  }
}

resource "azurerm_network_security_rule" "db_nsg_rule_inbound" {
  for_each                    = local.db_inbound_ports_map
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
  network_security_group_name = azurerm_network_security_group.dbsubnet_nsg.name

}

# 4. associate subnet nsg
resource "azurerm_subnet_network_security_group_association" "dbsubnet_nsg_associate" {
  depends_on                = [azurerm_network_security_rule.db_nsg_rule_inbound, azurerm_subnet.dbsubnet]
  subnet_id                 = azurerm_subnet.dbsubnet.id
  network_security_group_id = azurerm_network_security_group.dbsubnet_nsg.id
}