#variable "worker_name" {}
#variable "vault_client_token" {}
#
#resource "boundary_credential_store_vault" "vault" {
#  name        = "Local Vault"
#  description = "My first Vault credential store!"
#  address     = var.vault_addr
#  token       = var.vault_client_token
#  scope_id    = boundary_scope.project.id
#  worker_filter = "\"${var.worker_name}\" in \"/tags/type\""
#}
#
#resource "boundary_credential_library_vault" "postgres_dev1" {
#  name                = "postgres_dev1"
#  description         = "My first Vault credential library!"
#  credential_store_id = boundary_credential_store_vault.vault.id
#  path                = "postgres/creds/dev1" # change to Vault backend path
#  http_method         = "GET"
#}
#
#resource "boundary_target" "db_postgres" {
#  name         = "My Local PostgreSQL"
#  description  = "Access to PostgreSQL"
#  type         = "tcp"
#  default_port = "5432"
#  scope_id     = boundary_scope.project.id
#  address      = "127.0.0.1"
#  brokered_credential_source_ids = [
#    boundary_credential_library_vault.postgres_dev1.id
#  ]
#  egress_worker_filter     = "\"${var.worker_name}\" in \"/tags/type\""
#  session_max_seconds      = 360
#  session_connection_limit = 1
#}
#
#output "db_postgres_target_id" {
#  value = boundary_target.db_postgres.id
#}