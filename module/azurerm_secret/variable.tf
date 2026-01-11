variable "secrets" {
  type = map(object({
    secret_name         = string
    secret_value        = string
    key_name            = string
    resource_group_name = string
  }))
}
