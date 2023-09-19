provider "boundary" {
  addr                   = var.addr
  auth_method_login_name = var.username
  auth_method_password   = var.password
  scope_id               = var.org_id
}