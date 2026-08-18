variable "environment" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type    = string
  default = "uksouth"
}

variable "sql_admin_login" {
  type = string
}

variable "sql_admin_password" {
  type      = string
  sensitive = true
}