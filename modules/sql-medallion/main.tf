resource "azurerm_mssql_server" "this" {
  name                         = "sql-medallion-${var.environment}"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_login
  administrator_login_password = var.sql_admin_password
  minimum_tls_version           = "1.2"
}

resource "azurerm_mssql_database" "medallion" {
  for_each  = toset(["bronze", "silver", "gold"])
  name      = each.key
  server_id = azurerm_mssql_server.this.id

  sku_name    = "GP_S_Gen5_1"   # serverless, general purpose — cheap, auto-pauses
  auto_pause_delay_in_minutes = 60
  min_capacity = 0.5
}

resource "azurerm_mssql_firewall_rule" "allow_azure_services" {
  name             = "AllowAzureServices"
  server_id        = azurerm_mssql_server.this.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}