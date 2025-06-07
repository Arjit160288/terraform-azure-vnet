provider "azurerm" {

}

variable "vnet" {
  description = "The name of the virtual network."
  type        = string
  default     = "my_vnet"
}

variable "location" {
  description = "The Azure region to deploy resources."
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default     = "my_resource-group"
}

variable "vnet_address" {
  description = "The address space for the virtual network."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnets" {
  description = "List of subnets to create in the virtual network."
  default     = ["subnet-1", "subnet-2", "subnet-3"]
}

variable "subnet_address_prefix" {
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
  default     = {}
}
