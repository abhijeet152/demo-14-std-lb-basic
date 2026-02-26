######
# Public IP
# variables for public ip of load balancer
variable "lb_public_ip_name" {
    description = "lb public ip name"
    type = string
  
}

# resource group name
variable "resourcegroup_name" {
    description = "rg name further pointing from rg module"
    type = string
}

# location
variable "location" {
    description = "location pointing from rg module"
    type = string
}


#####
# Load balancer variables.
variable "web_lb_name" {
    description = "web load balancer name"
    type = string
}

# associate nic with standard lb
variable "network_interface_id" {
    description = "access it from module vm-linux network interface"
    type = string
  
}

variable "ip_configuration_name" {
    description = "access it from module vm-linux ip_configuration[0].name"
    type = string
}

