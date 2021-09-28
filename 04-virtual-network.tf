# Create Virtual Network
resource "azurerm_virtual_network" "vnet_gitlab" {
  name                = var.vnet_gitlab
  location            = azurerm_resource_group.rg_gitlab.location
  resource_group_name = azurerm_resource_group.rg_gitlab.name
  address_space       = ["10.0.0.0/16"]
}

# Create a Subnet for Gitlab Server
resource "azurerm_subnet" "subnet_gitlab_server" {
  name                 = var.subnet_gitlab_server
  virtual_network_name = azurerm_virtual_network.vnet_gitlab.name
  resource_group_name  = azurerm_resource_group.rg_gitlab.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create a Subnet for Gitlab Runners
resource "azurerm_subnet" "subnet_gitlab_runners" {
  name                 = var.subnet_gitlab_runners
  virtual_network_name = azurerm_virtual_network.vnet_gitlab.name
  resource_group_name  = azurerm_resource_group.rg_gitlab.name
  address_prefixes     = ["10.0.2.0/24"]
}



