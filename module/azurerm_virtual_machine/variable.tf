variable "vms" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    size                = string
    key_name            = string
    nic_name            = string
    secret_name         = string
    secret_value        = string
    os_disks = list(object({
      caching              = string
      storage_account_type = string
    }))

    source_image_references = list(object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    }))
  }))
}


