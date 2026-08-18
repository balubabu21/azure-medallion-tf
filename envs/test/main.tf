module "medallion" {
  source              = "../../modules/sql-medallion"
  environment         = "test"
  resource_group_name = "rg-medallion-test"
  sql_admin_login     = var.sql_admin_login
  sql_admin_password  = var.sql_admin_password
}