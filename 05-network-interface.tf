
# Create a Network Interface for Gitlab Runners

resource "azurerm_network_interface" "ni_gitlab_runners" {
  name                = var.network_interface_gitlab_runners
  location            = azurerm_resource_group.rg_gitlab.location
  resource_group_name = azurerm_resource_group.rg_gitlab.name

  ip_configuration {
    name                          = "ipc_gitlab_runners"
    subnet_id                     = azurerm_subnet.subnet_gitlab_runners.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Create a Network Interface for Gitlab Server

resource "azurerm_network_interface" "ni_gitlab_server" {
  name                = var.network_interface_gitlab_server
  location            = azurerm_resource_group.rg_gitlab.location
  resource_group_name = azurerm_resource_group.rg_gitlab.name

  ip_configuration {
    name                          = "ipc_gitlab_server"
    subnet_id                     = azurerm_subnet.subnet_gitlab_server.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "ni_nsg_association" {
    network_interface_id      = azurerm_network_interface.ni_gitlab_server.id
    network_security_group_id = azurerm_network_security_group.nsg_gitlab.id
}