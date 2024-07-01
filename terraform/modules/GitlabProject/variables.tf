variable "GitlabProjectId" {
  type        = string
  description = "The ids of the gitlab projects."
}

variable "ProjectStage" {
  type        = string
  description = "The name of the targeted environment."
}

locals {
  commonName           = "${var.GitlabProjectId}-${var.ProjectStage}"
  approleAuthRoleName  = "tf-app-${local.commonName}"
  jwtAuthRoleName      = "tf-jwt-${local.commonName}"
  PolicyName           = "tf-pol-${local.commonName}"
  approleSecretPath    = "tf-${var.GitlabProjectId}/${var.ProjectStage}/vault-approle"
  kubeconfigSecretPath = "tf-${var.GitlabProjectId}/*"
}
