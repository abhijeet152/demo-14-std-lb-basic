# # variables for public ip
# variable "web_linuxvm_publicip_name" {
#   description = "web linux vm public ip name"
#   type        = string
# }

variable "location" {
  description = "location"
  type        = string
}

variable "resource_group_name" {
  description = "rg name"
  type        = string
}

# network interface cards (nic)
variable "web_linuxvm_nic_name" {
  description = "value"
  type        = string
}

variable "subnet_id" {
  description = "subnet id where vm is going to deploy"
  type        = string

}

# linux vm variables.
variable "vmlinux_name" {
  description = "vm linux name"
  type        = string
}

