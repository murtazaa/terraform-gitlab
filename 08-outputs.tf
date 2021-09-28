# Create Outputs
# 1. Resource Group Location
# 2. Resource Group Id
# 3. Resource Group Name

# Resource Group Outputs
output "location" {
  value = azurerm_resource_group.rg_gitlab.location
}

output "resource_group_id" {
  value = azurerm_resource_group.rg_gitlab.id
}

output "resource_group_name" {
  value = azurerm_resource_group.rg_gitlab.name
}
