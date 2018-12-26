module "tls_certs" {
  source = "github.com/hashicorp/terraform-aws-vault//modules/private-tls-cert?ref=v0.11.3"
  ca_public_key_file_path = "${var.output_directory}/ca.crt.pem"
  public_key_file_path = "${var.output_directory}/vault.crt.pem"
  private_key_file_path = "${var.output_directory}/vault.key.pem"
  owner = "${var.owner}"
  organization_name = "${var.organization_name}"
  ca_common_name = "${var.ca_common_name}"
  common_name = "${var.common_name}"
  dns_names = "${var.dns_names}"
  ip_addresses = "${var.ip_addresses}"
  validity_period_hours = "${var.validity_period_hours}"
}

data "local_file" "ca_public_key_file" {
  depends_on = [ "module.tls_certs" ]
  filename = "${module.tls_certs.ca_public_key_file_path}"
}

data "local_file" "public_key_file" {
  depends_on = [ "module.tls_certs" ]
  filename = "${module.tls_certs.public_key_file_path}"
}

data "local_file" "private_key_file" {
  depends_on = [ "module.tls_certs" ]
  filename = "${module.tls_certs.private_key_file_path}"
}

data "aws_kms_ciphertext" "encrypted_ca_public_key" {
  key_id = "${data.aws_kms_alias.vault_packer.target_key_id}"
  plaintext = "${data.local_file.ca_public_key_file.content}"
}

data "aws_kms_ciphertext" "encrypted_public_key" {
  key_id = "${data.aws_kms_alias.vault_packer.target_key_id}"
  plaintext = "${data.local_file.public_key_file.content}"
}

data "aws_kms_ciphertext" "encrypted_private_key" {
  key_id = "${data.aws_kms_alias.vault_packer.target_key_id}"
  plaintext = "${data.local_file.private_key_file.content}"
}