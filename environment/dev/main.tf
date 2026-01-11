module "resource_group" {
  source          = "../../module/azurerm_resource_group"
  resource_groups = var.resource_groups
}

module "storageaccount" {
  source          = "../../module/azurerm_storage_account"
  depends_on      = [module.resource_group]
  storageaccounts = var.storageaccounts
}

module "virtual_network" {
  depends_on       = [module.resource_group]
  source           = "../../module/azurerm_virtual_network"
  virtual_networks = var.virtual_networks
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_public_ip"
  public_ips = var.public_ips
}

module "netowrk_interface" {
  depends_on         = [module.resource_group, module.virtual_network, module.public_ip]
  source             = "../../module/azurerm_network_interface_card"
  netowrk_interfaces = var.netowrk_interfaces
}

module "key_vault" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_key_vault"
  key_vaults = var.key_vaults
}

module "secret" {
  depends_on = [module.key_vault]
  source     = "../../module/azurerm_secret"
  secrets    = var.secrets
}

module "mssql_server" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_sql_server"
  servers    = var.servers
}

module "database" {
  depends_on = [module.resource_group, module.mssql_server]
  source     = "../../module/azurerm_database"
  databases  = var.databases
}

module "vm" {
  depends_on = [module.virtual_network, module.public_ip, module.netowrk_interface, module.secret]
  source     = "../../module/azurerm_virtual_machine"
  vms        = var.vms
}
