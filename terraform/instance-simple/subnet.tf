resource "azurerm_subnet" "local-subnet" {
  name                 = "local-subnet"
  resource_group_name  = azurerm_resource_group.local-rgp.name
  virtual_network_name = azurerm_virtual_network.local-vnet.name
  address_prefix       = "10.0.1.0/24"
}
