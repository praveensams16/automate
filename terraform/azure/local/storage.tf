resource "azurerm_storage_account" "local-stg" {
  name                     = "locastg"
  resource_group_name      = azurerm_resource_group.local-rgp.name
  location                 = azurerm_resource_group.local-rgp.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    environment = "local"
  }
}
