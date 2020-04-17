resource "azurerm_network_interface" "local-inter" {
  name                = "local-interface"
  location            = azurerm_resource_group.local-rgp.location
  resource_group_name = azurerm_resource_group.local-rgp.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.local-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.local-publicip.id
  }
}
