variable "GitlabProjectId" {
  type        = string
  description = "The ids of the gitlab projects."
}

variable "ProjectStage" {
  type        = string
  description = "The name of the targeted environment."
}

variable "jwt_auth_backend_path" {
  type        = string
  description = "The path of the JWT auth backend"
}

variable "BoundClaimsIdentifier" {
  type        = string
  description = "The name of the targeted environment."
  default     = ""
}

locals {
  commonNamePostfix    = var.BoundClaimsIdentifier != "" ? "${var.ProjectStage}-${var.BoundClaimsIdentifier}" : var.ProjectStage
  commonName           = "${var.GitlabProjectId}-${local.commonNamePostfix}"
  approleAuthRoleName  = "tf-app-${local.commonName}"
  jwtAuthRoleName      = "tf-jwt-${local.commonName}"
  PolicyName           = "tf-pol-${local.commonName}"
  approleSecretPath    = "tf-${var.GitlabProjectId}"
  kubeconfigSecretPath = "tf-${var.GitlabProjectId}/*"
}
