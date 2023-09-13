resource "hcp_boundary_cluster" "workshop" {
  cluster_id = var.cluster_name
  username   = var.admin_user
  password   = random_password.password.result
  tier       = "Plus"
}

resource "random_password" "password" {
  length  = 10
  special = false
}
