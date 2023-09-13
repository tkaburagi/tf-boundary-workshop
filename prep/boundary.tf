resource "boundary_scope" "org" {
  count                    = var.pet_count
  scope_id                 = "global"
  name                     = random_pet.pet[count.index].id
  auto_create_admin_role   = true
  auto_create_default_role = true
}

resource "boundary_scope" "project" {
  count                    = var.pet_count
  scope_id                 = boundary_scope.org[count.index].id
  name                     = "default"
  auto_create_admin_role   = true
  auto_create_default_role = true
}

resource "boundary_auth_method" "password" {
  count    = var.pet_count
  name     = "password"
  scope_id = boundary_scope.org[count.index].id
  type     = "password"
}

resource "boundary_account_password" "password" {
  count          = var.pet_count
  auth_method_id = boundary_auth_method.password[count.index].id
  login_name     = "handson"
  password       = random_pet.pet[count.index].id
  name = random_pet.pet[count.index].id
}

resource "boundary_user" "handson-user" {
  count       = var.pet_count
  name        = random_pet.pet[count.index].id
  scope_id    = boundary_scope.org[count.index].id
  account_ids = [boundary_account_password.password[count.index].id]
}

resource "boundary_role" "org_admin" {
  count          = var.pet_count
  scope_id       = boundary_scope.org[count.index].id
  grant_scope_id = boundary_scope.org[count.index].id
  grant_strings  = ["id=*;type=*;actions=*"]
  principal_ids  = [boundary_user.handson-user[count.index].id]
}

resource "boundary_role" "default_pj_admin" {
  count          = var.pet_count
  scope_id       = boundary_scope.org[count.index].id
  grant_scope_id = boundary_scope.project[count.index].id
  grant_strings  = ["id=*;type=*;actions=*"]
  principal_ids  = [boundary_user.handson-user[count.index].id]
}

resource "random_pet" "pet" {
  count = var.pet_count
}