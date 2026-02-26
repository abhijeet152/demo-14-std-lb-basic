terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.58.0"
    }
  }


}

provider "azurerm" {
  features {

  }
  subscription_id = "fee3badb-324c-44d6-9f37-855eced24ba1"
}