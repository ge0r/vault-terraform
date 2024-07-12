variable "department" {
  type        = string
  description = "The department of this approle."
}

variable "usecase" {
  type        = string
  description = "The usecase for this approle."
}

variable "stage" {
  type        = string
  description = "The stage for this approle."
}

variable "mountpath" {
  type        = string
  description = "The Mount path to write back the approle secret"
}

variable "PolicyMap" {
  description = "Map of paths to capabilites"
  type        = map(any)
}

locals {
  commonName          = "${var.department}-${var.usecase}-${var.stage}"
  approleAuthRoleName = "tf-app-${local.commonName}"
  PolicyName          = "tf-pol-${local.commonName}"
  approleSecretPath   = "tf-approles/${local.approleAuthRoleName}"
}
