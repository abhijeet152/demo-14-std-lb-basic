# bastion host public ip

variable "bastion_host_publicip_name" {
  description = "public ip name"
  type = string
}

variable "resource_group_name" {
  description = "rg name"
  type = string
}

variable "location" {
  description = "location"
  type = string
}

# bastion host nic 
variable "bastion_host_linuxvm_nic_name" {
  description = "name"
  type = string
}

# subnet id
variable "bastionsubnet_id" {
  description = "bastion subnet id"
  type = string
}

variable "bastion_host_linuxvm_name" {
  description = "bastion host name"
  type = string
}