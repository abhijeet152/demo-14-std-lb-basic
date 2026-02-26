## resource group module
module "resource_group" {
  source             = "../../modules/rg"
  resourcegroup_name = "dev-rg-01"
  location           = "east us"

}

## vnet module
module "virtualnetwork" {
  source                       = "../../modules/vnet"
  virtualnetwork_name          = "dev-vnet-01"
  resourcegroup_name           = module.resource_group.rg_name_out
  location                     = module.resource_group.location_out
  virtualnetwork_address_space = ["10.0.0.0/16"]
  websubnet_name               = "dev-web-subnet-01"
  websubnet_address_space      = ["10.0.1.0/24"]
  websubnet_nsg_name           = "dev-web-subnet-nsg-01"
  appsubnet_name               = "dev-app-subnet-01"
  appsubnet_address_space      = ["10.0.2.0/24"]
  appsubnet_nsg_name           = "dev-app-subnet-nsg-01"
  dbsubnet_name                = "dev-db-subnet-01"
  dbsubnet_address_space       = ["10.0.3.0/24"]
  dbsubnet_nsg_name            = "dev-db-subnet-nsg-01"
  bastionsubnet_name           = "dev-bastion-subnet-01"
  bastionsubnet_address_space  = ["10.0.4.0/24"]
  bastionsubnet_nsg_name       = "dev-bastion-subnet-nsg-01"
}

## linux vm module
module "vm_linux" {
  source                    = "../../modules/vm-linux"
  #web_linuxvm_publicip_name = "dev-linuxpublic-ip-01"
  location                  = module.resource_group.location_out
  resource_group_name       = module.resource_group.rg_name_out
  web_linuxvm_nic_name      = "dev-web-linuxvm-nic-01"
  subnet_id                 = module.virtualnetwork.websubnet_id_out
  vmlinux_name              = "dev-vmlinux-01"
}

## bastion linux vm
# module "bastion_linux_vm" {
#   source = "../../modules/bastion-vm-linux"
#   location = module.resource_group.location_out
#   resource_group_name = module.resource_group.rg_name_out
#   bastion_host_linuxvm_name = "dev-bastion-linuxvm-01"
#   bastion_host_linuxvm_nic_name = "dev-bastion-linuxvm-nic-01"
#   bastion_host_publicip_name = "dev-bastion-linuxvm-publicip-01"
#   bastionsubnet_id = module.virtualnetwork.bastionsubnet_id_out
  
# }


## standard load balancer
module "lb_std" {
  source = "../../modules/standard-lb"
  lb_public_ip_name = "dev-lb-public-ip-01"
  resourcegroup_name = module.resource_group.rg_name_out
  location = module.resource_group.location_out
  web_lb_name = "dev-web-lb-01"
  network_interface_id = module.vm_linux.web_linuxvm_nic_id_out
  ip_configuration_name = module.vm_linux.web_linuxvm_nic_ip_configuration_0
  
}