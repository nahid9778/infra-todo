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