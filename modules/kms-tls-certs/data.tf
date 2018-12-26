data "aws_kms_alias" "vault_packer" {
  name = "alias/${var.alias_name}"
}