#output "password" {
#  value     = hcp_boundary_cluster.workshop.cluster_id
#  sensitive = true
#}
#
#output "ca_host_ip" {
#  value = aws_instance.ssh_pubkey_instance.public_ip
#}
#
#output "user_id" {
#  value = [boundary_user.handson-user.*.id]
#}
#
#output "default_pj_id" {
#  value = [boundary_scope.project.*.id]
#}
#
#output "org_id" {
#  value = [boundary_scope.org.*.id]
#}
#
#output "org_name" {
#  value = [boundary_scope.org.*.name]
#}
#
#output "worker-filter" {
#  value = "\"/name\" == \"w_NdnBI7xXKC\""
#}