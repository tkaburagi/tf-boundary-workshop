#resource "boundary_host_catalog_plugin" "aws" {
#  name            = "My aws catalog"
#  description     = "My first host catalog!"
#  scope_id        = boundary_scope.project.id
#  plugin_name     = "aws"
#  attributes_json = jsonencode({
#    "region" = "ap-northeast-1",
#    "disable_credential_rotation" = true
#  })
#
#  # recommended to pass in aws secrets using a file() or using environment variables
#  # the secrets below must be generated in aws by creating a aws iam user with programmatic access
#  secrets_json = jsonencode({
#    "access_key_id"     = "aws_access_key_id_value",
#    "secret_access_key" = "aws_secret_access_key_value"
#  })
#}