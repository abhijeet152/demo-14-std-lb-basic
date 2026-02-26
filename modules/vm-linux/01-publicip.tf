# # create public ip
# resource "azurerm_public_ip" "web_linuxvm_publicip" {
#   name                = var.web_linuxvm_publicip_name
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   allocation_method   = "Dynamic"
#   sku                 = "Basic"
#   #domain_name_label = "app1-vm-randomstring"
# }

