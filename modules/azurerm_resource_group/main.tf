resource "azurerm_resource_group" "Rg1" {
  for_each = var.Rgs
  name     = each.value.resource_group_name
  location = each.value.location
}
