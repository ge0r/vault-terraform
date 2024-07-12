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

locals {
  commonName           = "${var.GitlabProjectId}-${var.ProjectStage}"
  approleAuthRoleName  = "tf-app-${local.commonName}"
  jwtAuthRoleName      = "tf-jwt-${local.commonName}"
  PolicyName           = "tf-pol-${local.commonName}"
  approleSecretPath    = "tf-${var.GitlabProjectId}"
  kubeconfigSecretPath = "tf-${var.GitlabProjectId}/*"
}

variable "PolicyMap" {
  description = "Map of paths to capabilities"
  type        = map(any)
}

variable "BoundClaims" {
  description = "Map of paths to their respective bound claims"
  type        = map(map(string))
  default     = {}
}
