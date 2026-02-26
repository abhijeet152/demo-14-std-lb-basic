# outputs for rg
output "rg_name_out" {
  description = "name of rg"
  value       = azurerm_resource_group.rg.name
}

output "location_out" {
  description = "location of rg"
  value       = azurerm_resource_group.rg.location
}
