# vnet resource
resource "azurerm_virtual_network" "vnet" {
  name                = var.virtualnetwork_name
  location            = var.location
  resource_group_name = var.resourcegroup_name
  address_space       = var.virtualnetwork_address_space

  timeouts {
    create = "80m" # Increase create timeout to 80 minutes
    update = "80m"
    delete = "80m"
  }

}