provider "azurerm" {

}

variable "location" {
  default = "East US"
}

variable "resource_group_name" {
  default = "dev-rg"
}
