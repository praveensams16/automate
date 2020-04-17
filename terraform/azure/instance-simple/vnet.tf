resource "azurerm_resource_group" "local-rgp" {
  name     = "local-rgp"
  location = "West Europe"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "local-vnet" {
  name                = "local-vnet"
  resource_group_name = azurerm_resource_group.local-rgp.name
  location            = azurerm_resource_group.local-rgp.location
  address_space       = ["10.0.0.0/16"]
}



