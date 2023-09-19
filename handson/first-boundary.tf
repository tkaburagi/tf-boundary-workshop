#resource "boundary_target" "wikipedia" {
#  name         = "wikipedia"
#  description  = "Access to Wikipedia"
#  type         = "tcp"
#  default_port = "443"
#  scope_id     = var.default_pj_id
#  address      = "ja.wikipedia.org"
#}
#
#output "wikipedia_target_id" {
#  value = boundary_target.wikipedia.id
#}