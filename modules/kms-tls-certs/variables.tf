variable "owner" {
  type = "string"
  description = "The OS user who should be given ownership over the certificate files."
}

variable "alias_name" {
  type = "string"
}

variable "organization_name" {
  type = "string"
}

variable "ca_common_name" {
  type = "string"
}

variable "common_name" {
  type = "string"
}

variable "validity_period_hours" {
  type = "string"
}

variable "output_directory" {
  type = "string"
  default = "/tmp"
}

variable "dns_names" {
  type = "list"
  default = []
}

variable "ip_addresses" {
  type = "list"
  default = []
}