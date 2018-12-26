output "ca_public_key" {
  value = "\nEncrypted string: ${data.aws_kms_ciphertext.encrypted_ca_public_key.ciphertext_blob}\n\n(File also saved to: ${module.tls_certs.ca_public_key_file_path})\n"
}

output "public_key" {
  value = "\nEncrypted string: ${data.aws_kms_ciphertext.encrypted_public_key.ciphertext_blob}\n\n(File also saved to: ${module.tls_certs.public_key_file_path})\n"
}

output "private_key" {
  value = "\nEncrypted string: ${data.aws_kms_ciphertext.encrypted_private_key.ciphertext_blob}\n\n(File also saved to: ${module.tls_certs.private_key_file_path})\n"
}