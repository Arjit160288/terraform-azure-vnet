module "Modules" {
  source              = "./Modules"
  vnet_name           = "my_vnet"
  location            = "East US"
  resource_group_name = "my_resource-group"
  vnet_address        = "10.0.0.0/16"

  tags = {
    environment = "dev"
    project     = "vnet-module"
  }
}
