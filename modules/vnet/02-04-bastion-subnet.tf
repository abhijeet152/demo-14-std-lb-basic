# 1. bastion subnet
# 2. bastion subnet nsg
# 3. nsg rules
# 4. associate subnet nsg

# 1. bastion subnet

resource "azurerm_subnet" "bastionsubnet" {
  name                 = var.bastionsubnet_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.resourcegroup_name
  address_prefixes     = var.bastionsubnet_address_space
  depends_on           = [azurerm_subnet.dbsubnet]
}

# 2. bastion subnet nsg

resource "azurerm_network_security_group" "bastionsubnet_nsg" {
  name                = var.bastionsubnet_nsg_name
  location            = var.location
  resource_group_name = var.resourcegroup_name
}

# 3. nsg rules
locals {
  bastion_inbound_ports_map = {
    "100" : "22",
    "110" : "3389"
  }
}

# nsg inbound rules for bastion subnet
resource "azurerm_network_security_rule" "bastion_nsg_rule_inbound" {
  for_each                    = local.bastion_inbound_ports_map
  name                        = "Rule-Port-${each.key}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resourcegroup_name
  network_security_group_name = azurerm_network_security_group.bastionsubnet_nsg.name
}


# 4. associate subnet nsg
resource "azurerm_subnet_network_security_group_association" "bastionsubnet_nsg_associate" {
  depends_on = [ azurerm_network_security_rule.bastion_nsg_rule_inbound ]
  network_security_group_id = azurerm_network_security_group.bastionsubnet_nsg.id
  subnet_id = azurerm_subnet.bastionsubnet.id
}