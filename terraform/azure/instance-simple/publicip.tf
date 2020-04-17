resource "azurerm_public_ip" "local-publicip" {
  name                    = "public-local-ip"
  location                = azurerm_resource_group.local-rgp.location
  resource_group_name     = azurerm_resource_group.local-rgp.name
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30

}
