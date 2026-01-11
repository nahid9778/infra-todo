resource_groups = {
  rg1 = {
    name       = "rg-todo-99"
    location   = "Central US"
    managed_by = "Terraform"
    tags = {
      environment = "dev"
      team        = "todo-team"
    }
  }
  rg2 = {
    name       = "rg-todo-98"
    location   = "Central US"
    managed_by = "Terraform"
    tags = {
      environment = "prod"
      team        = "todo-team"
    }
  }
}

storageaccounts = {
  stg1 = {
    name                     = "todostorage99"
    resource_group_name      = "rg-todo-99"
    location                 = "Central US"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    account_kind             = "StorageV2"
    access_tier              = "Cool"
  }
}

virtual_networks = {
  vnet1 = {
    name                = "vnet-todo-99"
    location            = "Central US"
    resource_group_name = "rg-todo-99"
    address_space       = ["10.0.0.0/16"]

    subnets = [{
      address_prefixes = ["10.0.1.0/24"]
      name             = "frontend-subnet"
      },
      {
        address_prefixes = ["10.0.2.0/24"]
        name             = "backend-subnet"
    }]
  }
  vnet2 = {
    name                = "vnet-todo-98"
    location            = "Central US"
    resource_group_name = "rg-todo-98"
    address_space       = ["10.0.0.0/16"]

    subnets = [{
      address_prefixes = ["10.0.10.0/24"]
      name             = "subnet-todo-99"
    }]
  }
}

public_ips = {
  pip1 = {
    name                = "pip-todo-99"
    resource_group_name = "rg-todo-99"
    location            = "Central US"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "pip-todo-98"
    resource_group_name = "rg-todo-99"
    location            = "Central US"
    allocation_method   = "Static"
  }
}

netowrk_interfaces = {

  nic1 = {
    name                 = "nic-frontend-99"
    location             = "Central US"
    resource_group_name  = "rg-todo-99"
    subnet_name          = "frontend-subnet"
    virtual_network_name = "vnet-todo-99"
    pip_name             = "pip-todo-99"

    ip_configurations = {
      ip1 = {
        name                          = "internal"
        private_ip_address_allocation = "Dynamic"
      }
    }
  }

  nic2 = {
    name                 = "nic-backend-99"
    location             = "Central US"
    resource_group_name  = "rg-todo-99"
    subnet_name          = "backend-subnet"
    virtual_network_name = "vnet-todo-99"
    pip_name             = "pip-todo-98"

    ip_configurations = {
      ip1 = {
        name                          = "internal"
        private_ip_address_allocation = "Dynamic"
      }
    }
  }
}

key_vaults = {

  kv1 = {
    name                        = "kv-todo-98"
    resource_group_name         = "rg-todo-99"
    location                    = "Central US"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
    sku_name                    = "standard"

    access_policys = [
      {
        key_permissions     = ["Get", "List"]
        secret_permissions  = ["Get", "List", "Recover", "Restore", "Set", "Purge", "Delete"]
        storage_permissions = ["Get", "List", "Restore", "Set", "Update"]
      }
    ]
  }
}

secrets = {
  secret1 = {
    key_name            = "kv-todo-98"
    secret_name         = "frontendvm"
    secret_value        = "Ali@1001"
    resource_group_name = "rg-todo-99"
  }
  secret2 = {
    key_name            = "kv-todo-98"
    secret_name         = "frontendpassword"
    secret_value        = "Ali@1002"
    resource_group_name = "rg-todo-99"
  }
  secret3 = {
    key_name            = "kv-todo-98"
    secret_name         = "backendvm"
    secret_value        = "Ali@1003"
    resource_group_name = "rg-todo-99"
  }
  secret4 = {
    key_name            = "kv-todo-98"
    secret_name         = "backendpassword"
    secret_value        = "Ali@1004"
    resource_group_name = "rg-todo-99"
  }
}

servers = {
  server1 = {
    name                         = "servertodo99"
    resource_group_name          = "rg-todo-99"
    location                     = "Central US"
    administrator_login          = "server001"
    administrator_login_password = "Ali@1001"
    version                      = "12.0"
  }
  server2 = {
    name                         = "servertodo98"
    resource_group_name          = "rg-todo-99"
    location                     = "Central US"
    administrator_login          = "server002"
    administrator_login_password = "Ali@1001"
    version                      = "12.0"
  }
}

databases = {
  database1 = {
    name                = "database99"
    server_name         = "servertodo99"
    resource_group_name = "rg-todo-99"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    license_type        = "LicenseIncluded"
    max_size_gb         = "2"
    sku_name            = "S0"
    enclave_type        = "VBS"
    tags = {
      environment = "dev"
    }
  }
  database2 = {
    name                = "database98"
    server_name         = "servertodo98"
    resource_group_name = "rg-todo-99"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    license_type        = "LicenseIncluded"
    max_size_gb         = "2"
    sku_name            = "S0"
    enclave_type        = "VBS"
    tags = {
      environment = "dev"
    }
  }
}

vms = {
  frontendvm = {
    name                = "frontend-vm-99"
    resource_group_name = "rg-todo-99"
    location            = "Central US"
    size                = "Standard_D2s_v3"
    nic_name            = "nic-frontend-99"
    key_name            = "kv-todo-98"
    secret_name         = "frontendvm"
    secret_value        = "frontendpassword"
    os_disks = [{
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }]
    source_image_references = [{
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }]
  }

  backendvm = {
    name                = "backend-vm-99"
    resource_group_name = "rg-todo-99"
    location            = "Central US"
    size                = "Standard_D2s_v3"
    nic_name            = "nic-backend-99"
    key_name            = "kv-todo-98"
    secret_name         = "backendvm"
    secret_value        = "backendpassword"
    os_disks = [{
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }]
    source_image_references = [{
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }]
  }
}
