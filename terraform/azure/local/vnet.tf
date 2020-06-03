resource "azurerm_virtual_network" "local-vnt" {
  name                = "local-vnt"
  resource_group_name = azurerm_resource_group.local-rgp.name
  location            = azurerm_resource_group.local-rgp.location
  address_space       = ["10.0.0.0/16"]
}



