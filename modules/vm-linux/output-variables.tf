# # Public ip outputs 
# output "web_linuxvm_public_ip_out" {
#   description = "web linux vm public address"
#   value       = azurerm_public_ip.web_linuxvm_publicip.ip_address
# }

# network interface outputs
# nic id
output "web_linuxvm_nic_id_out" {
  description = "web linux vm network interface id"
  value       = azurerm_network_interface.web_linuxvm_nic.id
}

# nic private ip
output "web_linuxvm_network_interface_private_ip_address" {
  description = "private ip address of vm where nic is attached"
  value       = azurerm_network_interface.web_linuxvm_nic.private_ip_addresses
}

# linux vm outputs

# output "web_linuxvm_publicip_address" {
#   description = "machine public ip address"
#   value       = azurerm_linux_virtual_machine.web_linuxvm.public_ip_address
# }

output "web_linuxvm_privateip_address" {
  description = "machine public ip address"
  value       = azurerm_linux_virtual_machine.web_linuxvm.private_ip_address
}

## Virtual Machine ID
output "web_linuxvm_virtual_machine_id" {
  description = "Web Linux Virtual Machine ID "
  value       = azurerm_linux_virtual_machine.web_linuxvm.id
}

## ip configuration outputs.
output "web_linuxvm_nic_ip_configuration_0" {
  description = "required while associating nic and load balancer"
  value = azurerm_network_interface.web_linuxvm_nic.ip_configuration[0].name
  
}