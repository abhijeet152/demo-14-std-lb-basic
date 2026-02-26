# vnet variables
variable "virtualnetwork_name" {
  description = "vnet name"
  type        = string
}

variable "location" {
  description = "vnet location"
  type        = string
}

variable "resourcegroup_name" {
  description = "vnet rg name"
  type        = string
}

variable "virtualnetwork_address_space" {
  description = "vnet address space"
  type        = list(string)
}

# web subnet variables

variable "websubnet_name" {
  description = "websubnet name"
  type        = string
}

variable "websubnet_address_space" {
  description = "web subnet address"
  type        = list(string)
}


variable "websubnet_nsg_name" {
  description = "web subnet nsg name"
  type        = string
}


# app subnet variables.
variable "appsubnet_name" {
  description = "app subnet name"
  type        = string
}

variable "appsubnet_address_space" {
  description = "app subnet address"
  type        = list(string)
}


# app subnet nsg variables.
variable "appsubnet_nsg_name" {
  description = "app subnet nsg name"
  type        = string
}


# db subnet variables
variable "dbsubnet_name" {
  description = "dbsubnet name"
  type        = string
}

variable "dbsubnet_address_space" {
  description = "dbsubnet name"
  type        = list(string)
}

# db subnet nsg
variable "dbsubnet_nsg_name" {
  description = "db subnet name"
  type        = string
}

# bastion subnet variables
variable "bastionsubnet_name" {
  description = "bastion subnet name"
  type        = string
}

variable "bastionsubnet_address_space" {
  description = "bastion subnet address space"
  type        = list(string)
}

# bastion subnet nsg name
variable "bastionsubnet_nsg_name" {
  description = "bastion subnet nsg"
}