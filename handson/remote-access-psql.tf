#variable "worker_name" {}
#
#resource "boundary_target" "db_postgres" {
#  name         = "My Local PostgreSQL"
#  description  = "Access to PostgreSQL"
#  type         = "tcp"
#  default_port = "5432"
#  scope_id     = boundary_scope.project.id
#  address      = "127.0.0.1"
#  brokered_credential_source_ids = [
#    boundary_credential_username_password.postgres.id
#  ]
#  egress_worker_filter     = "\"${var.worker_name}\" in \"/tags/type\""
#}
#
#resource "boundary_credential_username_password" "postgres" {
#  name                = "postgres_postgres_userpass"
#  credential_store_id = boundary_credential_store_static.static.id
#  username            = "postgres"
#  password            = "postgres"
#}
#
#output "db_postgres_target_id" {
#  value = boundary_target.db_postgres.id
#}