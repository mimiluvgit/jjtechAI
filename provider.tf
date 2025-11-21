terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.54.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "c9fe10b9-b166-4201-a654-526473352037"
}
