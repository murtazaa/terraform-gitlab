# Define Input Variables
# 1. Azure Location (EastUS)
# 2. Azure Resource Group Name 
# 3. Azure AKS Environment Name (Dev, QA, Prod)

# Azure Location
variable "location" {
  type        = string
  description = "Azure Region where all these resources will be provisioned"
  default     = "East US"
}

# Azure Resource Group Name
variable "resource_group_name" {
  type        = string
  description = "This variable defines the Resource Group"
  default     = "rg_gitlab"
}

# Azure Environment Name
variable "environment" {
  type        = string
  description = "This variable defines the Environment"
  default     = "env_dev"
}

variable "vnet_gitlab" {
  type        = string
  description = "This variable defines the VNet name for gitlab"
  default     = "vn_gitlab"
}

variable "subnet_gitlab_runners" {
  type        = string
  description = "This variable defines the Subnet name for gitlab runners"
  default     = "sn_gitlab_runners"
}

variable "subnet_gitlab_server" {
  type        = string
  description = "This variable defines the Subnet name for gitlab server"
  default     = "sn_gitlab_server"
}

variable "virtual_machine_host_name_gitlab_runners" {
  type        = string
  description = "This variable defines the Virtual Machine Host name for gitlab runners"
  default     = "vm-gitlab-runners"
}

variable "virtual_machine_gitlab_runners" {
  type        = string
  description = "This variable defines the Virtual Machine name for gitlab runners"
  default     = "vm_gitlab_runners"
}

variable "virtual_machine_host_name_gitlab_server" {
  type        = string
  description = "This variable defines the Virtual Machine host name for gitlab server"
  default     = "vm-gitlab-server"
}

variable "virtual_machine_gitlab_server" {
  type        = string
  description = "This variable defines the Virtual Machine name for gitlab server"
  default     = "vm_gitlab_server"
}

variable "network_interface_gitlab_server" {
  type        = string
  description = "This variable defines the Network Interface"
  default     = "ni_gitlab_runners"
}

variable "network_interface_gitlab_runners" {
  type        = string
  description = "This variable defines the Network Interface"
  default     = "ni_gitlab_runners"
}


# Windows Admin Username for k8s worker nodes
variable "admin_username" {
  type        = string
  default     = "azureuser" # Should be obtained from Vault secrets management
  description = "This variable defines the Windows admin username k8s Worker nodes"
}

# Windows Admin Password for k8s worker nodes
variable "admin_password" {
  type        = string
  default     = "P@ssw0rd123456789" # Should be obtained from Vault secrets management
  description = "This variable defines the Windows admin password k8s Worker nodes"
}

