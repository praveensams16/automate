provider "azurerm" {
    version = 1.38
    }


resource "azurerm_resource_group" "example" {
  name     = "testing"
  location = "East US"
}

resource "azurerm_storage_account" "lab" {
  name                     = "testing"
  resource_group_name      = "testing"
  location                 = "East US"
  account_tier            = "Standard"
  account_replication_type = "LRS"

   tags = {
    environment = "Terraform Storage"
    CreatedBy = "Admin"
      }
  }


