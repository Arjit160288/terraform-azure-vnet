terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "example" {
  name                = "${var.resource_group}"
  location            = "${var.location}"
}

resource "azurerm_virtual_network" "this" {
  name                = "${var.vnet}"
  location            = "${azurerm_resource_group.example.location}"
  resource_group_name = "${azurerm_resource_group.example.name}"
  address_space       = ["${var.vnet_address}"]
  tags                = var.tags
}

resource "azurerm_subnet" "this" {
  for_each = { for subnet in var.subnets : subnet.name => subnet }

  name                 = "testsubnet"
  resource_group_name  = "${azurerm_resource_group.example.name}"
  virtual_network_name = "${azurerm_virtual_network.this.name}"
  address_prefixes     = "10.0.1.0/24"
}
