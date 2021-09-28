# Create a Virtual Machie to host Gitlab Server

resource "azurerm_virtual_machine" "vm_gitlab_runners" {
  name                  = var.virtual_machine_gitlab_runners
  location              = azurerm_resource_group.rg_gitlab.location
  resource_group_name   = azurerm_resource_group.rg_gitlab.name
  network_interface_ids = [azurerm_network_interface.ni_gitlab_runners.id]
  vm_size               = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${var.virtual_machine_gitlab_runners}-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = var.virtual_machine_host_name_gitlab_runners
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = var.environment
  }
}