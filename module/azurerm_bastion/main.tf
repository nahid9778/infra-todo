# resource "azurerm_bastion_host" "azure_bastion" {
#   for_each            = var.azure_bastions
#   name                = each.value.name
#   location            = each.value.location
#   resource_group_name = each.value.resource_group_name

#   dynamic "ip_configuration" {
#     for_each = each.value.ip_configurations

#     content {
#       name                 = ip_configuration.value.name
#       subnet_id            = data.azurerm_subnet.subnet_ids.id
#       public_ip_address_id = data.azurerm_public_ip.pip_ids
#     }
#   }
# }


