module "vnet" {
  source              = "./modules/terraform-azure-vnet"
  vnet_name           = "my-vnet"
  location            = "East US"
  resource_group_name = "my-resource-group"
  vnet_address_space  = "10.0.0.0/16"
}
