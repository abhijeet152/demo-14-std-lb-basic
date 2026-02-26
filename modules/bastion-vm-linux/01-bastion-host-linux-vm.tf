# 1: Create Public IP Address
# 2: Create Network Interface
# 3: Azure Linux Virtual Machine - Bastion Host

# 1: Create Public IP Address
resource "azurerm_public_ip" "bastion_host_publicip" {
  name = var.bastion_host_publicip_name
  resource_group_name = var.resource_group_name
  location = var.location
  allocation_method = "Static"
  sku = "Standard"
}


# 2: Create Network Interface
resource "azurerm_network_interface" "bastion_host_linuxvm_nic" {
  name = var.bastion_host_linuxvm_nic_name
  location = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name = "bastion-host-ip-1"
    subnet_id = var.bastionsubnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.bastion_host_publicip.id
  }

}

# 3: Azure Linux Virtual Machine - Bastion Host
resource "azurerm_linux_virtual_machine" "bastion_host_linuxvm" {
  name = var.bastion_host_linuxvm_name
  resource_group_name = var.resource_group_name
  location = var.location
  size = "Standard_DS1_v2"
  admin_username = "azureuser"
  network_interface_ids = [ azurerm_network_interface.bastion_host_linuxvm_nic.id ]
  admin_ssh_key {
    username = "azureuser"
    public_key = file("/tmp/public.pub")
  }
  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "RedHat"
    offer = "RHEL"
    sku = "83-gen2"
    version = "latest"
  }
}