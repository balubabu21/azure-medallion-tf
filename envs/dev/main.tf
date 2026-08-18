module "medallion" {
  source              = "../../modules/sql-medallion"
  environment         = "dev"
  resource_group_name = "rg-medallion-dev"
  sql_admin_login     = var.sql_admin_login
  sql_admin_password  = var.sql_admin_password
}