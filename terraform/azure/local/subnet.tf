resource "azurerm_subnet" "local-subnet" {
  name                 = "localsubnet"
  resource_group_name  = azurerm_resource_group.local-rgp.name
  virtual_network_name = azurerm_virtual_network.local-vnt.name
  address_prefix       = "10.0.1.0/24"
}
