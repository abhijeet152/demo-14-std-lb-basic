# vnet outputs
output "vnet_name_out" {
  description = "vnet name"
  value       = azurerm_virtual_network.vnet.name
}

# websubnet outputs
output "websubnet_name_out" {
  description = "websubnet name"
  value       = azurerm_subnet.websubnet.name
}
# websubnet id
output "websubnet_id_out" {
  description = "web subnet id"
  value       = azurerm_subnet.websubnet.id
}

# websubnet nsg outputs
output "websubnet_nsg_name_out" {
  description = "websubnet nsg name"
  value       = azurerm_network_security_group.websubnet_nsg.name
}



# app subnet outputs
output "appsubnet_name_out" {
  description = "app subnet name"
  value       = azurerm_subnet.appsubnet.name
}

# app subnet nsg name
output "appsubnet_nsg_name_out" {
  description = "app subnet nsg name"
  value       = azurerm_network_security_group.appsubnet_nsg.name
}

# db subnet output
output "dbsubnet_name_out" {
  description = "db subnet name"
  value       = azurerm_subnet.dbsubnet.name
}

output "dbsubnet_nsg_name_out" {
  description = "db nsg name"
  value       = azurerm_network_security_group.dbsubnet_nsg.name
}

# bastion subnet name
output "bastionsubnet_name_out" {
  description = "bastion subnet name"
  value       = azurerm_subnet.bastionsubnet.name
}

# bastion subnet id
output "bastionsubnet_id_out" {
  description = "bastion subnet id out"
  value = azurerm_subnet.bastionsubnet.id
}

# bastion subnet nsg name
output "bastionsubnet_nsg_name_out" {
  description = "bastion subnet name"
  value       = azurerm_network_security_group.bastionsubnet_nsg.name
}