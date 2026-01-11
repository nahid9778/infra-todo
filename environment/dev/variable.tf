variable "resource_groups" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}
variable "storageaccounts" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    account_kind             = optional(string)
    access_tier              = optional(string)
  }))
}
variable "virtual_networks" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    subnets = optional(list(object({
      name             = string
      address_prefixes = list(string)
    })))
  }))
}
variable "public_ips" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
  }))
}
variable "netowrk_interfaces" {
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    virtual_network_name = string
    subnet_name          = string
    pip_name             = string
    ip_configurations = map(object({
      name                          = string
      private_ip_address_allocation = string
    }))
  }))
}

variable "key_vaults" {
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    enabled_for_disk_encryption = bool
    soft_delete_retention_days  = number
    purge_protection_enabled    = bool
    sku_name                    = string

    access_policys = list(object({
      key_permissions     = list(string)
      secret_permissions  = list(string)
      storage_permissions = list(string)
    }))
  }))
}
variable "secrets" {
  type = map(object({
    secret_name         = string
    secret_value        = string
    key_name            = string
    resource_group_name = string
  }))
}

variable "servers" {
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = optional(string)
    administrator_login_password = optional(string)
    minimum_tls_version          = optional(string)
    # azuread_administrators = optional(map(object({
    #   login_username = string
    #   object_id      = string
    # })))
    # tags = optional(map(string))
  }))
}

variable "databases" {
  type = map(object({
    name                = string
    server_name         = string
    resource_group_name = string
    collation           = string
    license_type        = string
    max_size_gb         = number
    sku_name            = string
    enclave_type        = string
    tags                = map(string)
  }))
}

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
