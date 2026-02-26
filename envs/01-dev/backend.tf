terraform {
  backend "azurerm" {
    resource_group_name   = "MyResourceGroup"
    storage_account_name  = "mystorageaccount20260123"
    container_name        = "mycontainer"
    key                   = "dev.terraform.tfstate"
    # lock_duration         = "60m" # Default is 50 minutes
    # lock_renewal_interval = "15m" # Default is 5 minutes
    # access_key is better passed via environment variable ARM_ACCESS_KEY
  }
}
