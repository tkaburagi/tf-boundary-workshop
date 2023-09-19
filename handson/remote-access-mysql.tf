#resource "boundary_target" "db_mysql" {
#  name         = "My Local MySQL"
#  description  = "Access to MySQL"
#  type         = "tcp"
#  default_port = "3306"
#  scope_id     = boundary_scope.project.id
#  address      = "127.0.0.1"
#  brokered_credential_source_ids = [
#    boundary_credential_username_password.mysql.id
#  ]
#  egress_worker_filter = "\"${var.worker_name}\" in \"/tags/type\""
#}
#
#resource "boundary_credential_username_password" "mysql" {
#  name                = "mysql_root_userpass"
#  credential_store_id = boundary_credential_store_static.static.id
#  username            = "root"
#  password            = "rooooot"
#}
#
#output "db_mysql_target_id" {
#  value = boundary_target.db_mysql.id
#}