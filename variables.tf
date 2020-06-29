variable "name" {
  description = "Name of the resources"
}

variable "billing_code" {
  description = "Tags the resource with a billing code"
}

variable "application" {
  description = "The application name"
}

variable "environment" {
  description = "The environment name"
}

variable "acl" {
  default = "private"
}

variable "index_document" {
  default = "index.html"
}

variable "error_document" {
  default = "error.html"
}

variable "routing_rules" {
  default = ""
}

variable "tags" {
  type = map

  default = {}
}

variable "subdomains" {
  type = list
  default = [""]

  description = <<EOF
    A list of subdomains that will access the cloudfront distribution.
    Leave an empty string \"\" to set the domain as an alias for the cloudfront domain
  EOF
}

variable "zone_id" {
  description = "The hosted zone id"
}

variable "acm_certificate_arn" {}