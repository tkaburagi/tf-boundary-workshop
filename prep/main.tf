terraform {}

provider "hcp" {
  project_id = var.hcp_pj_id
}

provider "aws" {}
#
#provider "boundary" {
#  addr                   = hcp_boundary_cluster.workshop.cluster_url
#  auth_method_login_name = hcp_boundary_cluster.workshop.username
#  auth_method_password   = hcp_boundary_cluster.workshop.password
#}

provider "random" {}
