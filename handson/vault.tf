#provider vault {
#  address = var.vault_addr
#  token = var.vault_token
#}
#
#variable "vault_addr" {}
#variable "vault_token" {}
#
#resource "vault_database_secrets_mount" "postgres" {
#  path = "postgres"
#  postgresql {
#    name              = "postgres"
#    username          = "postgres"
#    password          = "postgres"
#    connection_url    = "postgresql://{{username}}:{{password}}@127.0.0.1:5432/postgres"
#    verify_connection = true
#    allowed_roles = [
#      "dev1",
#    ]
#  }
#}
#
#resource "vault_database_secrets_mount" "mysql" {
#  path = "mysql"
#  mysql {
#    name              = "mysql"
#    username          = "root"
#    password          = "rooooot"
#    connection_url    = "{{username}}:{{password}}@tcp(127.0.0.1:3306)/"
#    verify_connection = true
#    allowed_roles = [
#      "dev2",
#    ]
#  }
#}
#
#resource "vault_database_secret_backend_role" "dev1" {
#  name    = "dev1"
#  backend = vault_database_secrets_mount.postgres.path
#  db_name = vault_database_secrets_mount.postgres.postgresql[0].name
#  creation_statements = [
#    "CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}';",
#    "GRANT SELECT ON ALL TABLES IN SCHEMA public TO \"{{name}}\";",
#  ]
#  default_ttl = 60
#}
#
#resource "vault_database_secret_backend_role" "dev2" {
#  name    = "dev2"
#  backend = vault_database_secrets_mount.mysql.path
#  db_name = vault_database_secrets_mount.mysql.mysql[0].name
#  creation_statements = [
#    "CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';GRANT SELECT ON *.* TO '{{name}}'@'%'",
#  ]
#  default_ttl = 600
#}
#
#resource "vault_policy" "read_postgres" {
#  name   = "read_postgres"
#  policy = <<EOT
#  path "auth/token/lookup-self" {
#    capabilities = ["read"]
#  }
#
#  path "auth/token/renew-self" {
#    capabilities = ["update"]
#  }
#
#  path "auth/token/revoke-self" {
#    capabilities = ["update"]
#  }
#
#  path "sys/leases/renew" {
#    capabilities = ["update"]
#  }
#
#  path "sys/leases/revoke" {
#    capabilities = ["update"]
#  }
#
#  path "sys/capabilities-self" {
#    capabilities = ["update"]
#  }
#  path "${vault_database_secrets_mount.postgres.path}/creds/${vault_database_secret_backend_role.dev1.name}" {
#      capabilities = ["read"]
#  }
#  path "${vault_database_secrets_mount.mysql.path}/creds/${vault_database_secret_backend_role.dev2.name}" {
#      capabilities = ["read"]
#  }
#  EOT
#}
