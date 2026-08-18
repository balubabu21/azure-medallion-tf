output "sql_server_fqdn" {
  value = azurerm_mssql_server.this.fully_qualified_domain_name
}