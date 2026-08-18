variable "sql_admin_login" {
  type        = string
  description = "SQL Server admin username"
}

variable "sql_admin_password" {
  type        = string
  sensitive   = true
  description = "SQL Server admin password"
}