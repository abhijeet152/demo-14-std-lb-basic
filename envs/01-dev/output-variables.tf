# module rg outputs
output "rg_name" {
  description = "module rg name"
  value       = module.resource_group.rg_name_out
}

output "location" {
  description = "location of rg"
  value       = module.resource_group.location_out
}

# module vnet outputs
output "vnet_name" {
  description = "vnet name"
  value       = module.virtualnetwork.vnet_name_out
}

# web subnet outputs.
output "websubnet_name" {
  description = "websubnet name"
  value       = module.virtualnetwork.websubnet_name_out
}

output "websubnet_id" {
  description = "id"
  value       = module.virtualnetwork.websubnet_id_out
}
# web subnet nsg
output "websubnet_nsg" {
  description = "web subnet nsg name"
  value       = module.virtualnetwork.websubnet_nsg_name_out
}

# app subnet output
output "appsubnet_name" {
  description = "name"
  value       = module.virtualnetwork.appsubnet_name_out
}

output "appsubnet_nsg_name" {
  description = "nsg name"
  value       = module.virtualnetwork.appsubnet_nsg_name_out
}


# output for db subnet
output "dbsubnet_name" {
  description = "db subnet name"
  value       = module.virtualnetwork.dbsubnet_name_out
}

output "dbsubnet_nsg_name" {
  description = "db subnet nsg name"
  value       = module.virtualnetwork.dbsubnet_nsg_name_out
}

# bastion subnet output
output "bastionsubnet_name" {
  description = "bastion subnet name"
  value       = module.virtualnetwork.bastionsubnet_name_out
}


# linux vm output
# output "linuxvm_public_ip" {
#   description = "vm name"
#   value = module.vm_linux.web_linuxvm_public_ip_out
# }

output "linuxvm_private_ip" {
  description = "private ip"
  value = module.vm_linux.web_linuxvm_privateip_address
}