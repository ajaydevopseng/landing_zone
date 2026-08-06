module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  Rgs    = var.Rgs
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_virtual_network"
  Vnet       = var.Vnet
}

module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../modules/azurerm_subnet"
  Subnets    = var.Subnets
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_public_IP"
  pips       = var.pips
}

module "virtual_machine" {
  depends_on = [module.subnet, module.public_ip]
  source     = "../../modules/azurerm_virtual_machine"
  Vms        = var.Vms
}
