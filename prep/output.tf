output "password" {
  value     = hcp_boundary_cluster.workshop.cluster_id
  sensitive = true
}

output "ca_host_ip" {
  value = aws_instance.ssh_pubkey_instance.public_ip
}

output "bucket_name" {
  value = aws_s3_bucket.example_bucket.bucket
}

output "bucket_region" {
  value = aws_s3_bucket.example_bucket.region
}

output "worker-filter" {
  value = "\"/name\" == \"w_NdnBI7xXKC\""
}