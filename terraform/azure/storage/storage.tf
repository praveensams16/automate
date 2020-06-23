provider "azurerm" {
    version = 1.38
    }



resource "azurerm_resource_group" "testyou" {
  location = "East US"
  name = "testyou"
  }

resource "azurerm_storage_account" "lab1" {
  name                     = "testyou"
  resource_group_name      = "testyou"
  location                 = "East US"
  account_tier            = "Standard"
  account_replication_type = "LRS"

   tags = {
    environment = "Terraform Storage"
    CreatedBy = "Admin"
      }
  depends_on = [azurerm_resource_group.testyou]
  }


