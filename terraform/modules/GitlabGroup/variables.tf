variable "GitlabNamespaceId" {
  type        = string
  description = "The id of the gitlab Group (namespace)."
}

variable "ProjectStage" {
  type        = string
  description = "The name of the targeted environment."
}

locals {
  commonName           = "group-${var.GitlabNamespaceId}-${var.ProjectStage}"
  approleAuthRoleName  = "tf-app-${local.commonName}"
  jwtAuthRoleName      = "tf-jwt-${local.commonName}"
  PolicyName           = "tf-pol-${local.commonName}"
  approleSecretPath    = "tf-group-${var.GitlabNamespaceId}/${var.ProjectStage}/vault-approle"
  kubeconfigSecretPath = "tf-group-${var.GitlabNamespaceId}/*"
}
