variable "ec2_ip" {
  default = "18.183.235.37"
}

variable "user_id" {
  default = "u_EUQDr1Tj5U"
}

resource "boundary_target" "ssh_aws" {
  name         = "My AWS EC2"
  description  = "Access to EC2 instance"
  type         = "ssh"
  default_port = "22"
  scope_id     = boundary_scope.project.id
  address      = var.ec2_ip
  injected_application_credential_source_ids = [
    boundary_credential_ssh_private_key.ubuntu.id
  ]
}

resource "boundary_credential_store_static" "static" {
  name        = "Static Secret Store"
  description = "My first static credential store!"
  scope_id    = boundary_scope.project.id
}

resource "boundary_credential_ssh_private_key" "ubuntu" {
  name                = "ubuntu_ssh_private_key"
  credential_store_id = boundary_credential_store_static.static.id
  username            = "ubuntu"
  private_key         = file("~/Downloads/ssh-keypair.pem") # change to valid SSH Private Key
}

resource "boundary_scope" "project" {
  scope_id                 = var.org_id
  name                     = "Remote Access Hands-on"
  auto_create_admin_role   = true
  auto_create_default_role = true
}

resource "boundary_role" "pj_admin" {
  scope_id       = var.org_id
  grant_scope_id = boundary_scope.project.id
  grant_strings  = ["id=*;type=*;actions=*"]
  principal_ids  = [var.user_id]
}

# ランダムな名前の生成
resource "random_pet" "bucket_name" {
  keepers = {
    timestamp = timestamp()
  }
}

# S3バケットの作成
resource "aws_s3_bucket" "example_bucket" {
  bucket = "boundary-sessions-${random_pet.bucket_name.id}"
  tags = {
    Name = "boundary-sessions-${random_pet.bucket_name.id}"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.example_bucket.bucket
}

output "bucket_region" {
  value = aws_s3_bucket.example_bucket.region
}

output "ssh_aws_target_id" {
  value = boundary_target.ssh_aws.id
}