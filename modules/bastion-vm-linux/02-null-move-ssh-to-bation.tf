# 1. Create a Null Resource and Provisioners
  # 1.2 Connection Block for Provisioners to connect to Azure VM Instance 
  # 1.3 File Provisioner: Copies the terraform-key.pem file to /tmp/terraform-key.pem
  # 1.4 Remote Exec Provisioner: Using remote-exec provisioner fix the private key permissions on Bastion Host


# 1. Create a Null Resource and Provisioners
resource "null_resource" "null_copy_ssh_key_to_bastion" {
  depends_on = [ azurerm_linux_virtual_machine.bastion_host_linuxvm ]
  # 1.2 Connection Block for Provisioners to connect to Azure VM Instance
  connection {
    type = "ssh"
    host = azurerm_linux_virtual_machine.bastion_host_linuxvm.public_ip_address
    user = azurerm_linux_virtual_machine.bastion_host_linuxvm.admin_username
    private_key = file("/tmp/private.pem")
  }
  # 1.3 File Provisioner: Copies the terraform-key.pem file from source agent/runner to destination vm/bastion at /tmp/terraform-key.pem
  provisioner "file" {
    source = "/tmp/private.pem"
    destination = "/tmp/private1.pem"
  }
  # 1.4 Remote Exec Provisioner: Using remote-exec provisioner fix the private key permissions on Bastion Host
  provisioner "remote-exec" {
    inline = [ 
        "sudo chmod 400 /tmp/private1.pem"
     ]
  }

}