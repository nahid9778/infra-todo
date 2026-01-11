resource "azurerm_linux_virtual_machine" "vm" {
  for_each                        = var.vms
  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = data.azurerm_key_vault_secret.admin_username[each.key].value
  admin_password                  = data.azurerm_key_vault_secret.admin_password[each.key].value
  disable_password_authentication = false
  network_interface_ids = [
    data.azurerm_network_interface.nic[each.key].id,
  ]

  #   admin_ssh_key {
  #     username   = "adminuser"
  #     public_key = file("~/.ssh/id_rsa.pub")
  #   }

  dynamic "os_disk" {
    for_each = each.value.os_disks
    content {
      caching              = os_disk.value.caching
      storage_account_type = os_disk.value.storage_account_type
    }
  }
  dynamic "source_image_reference" {
    for_each = each.value.source_image_references

    content {
      publisher = source_image_reference.value.publisher
      offer     = source_image_reference.value.offer
      sku       = source_image_reference.value.sku
      version   = source_image_reference.value.version
    }
  }
}


