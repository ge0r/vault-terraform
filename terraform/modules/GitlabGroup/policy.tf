data "vault_policy_document" "GitlabGroupPolicy" {
  rule {
    path         = "auth/token/create"
    capabilities = ["update"]
    description  = "Allow Access token updates"
  }
  rule {
    path         = local.approleSecretPath
    capabilities = ["read"]
    description  = "Allow read Access from Gitlab CI jwt."
  }

  rule {
    path         = "gitlab-kubeconfigs/data/${local.kubeconfigSecretPath}"
    capabilities = ["read"]
    description  = "Allow read Access from Gitlab CI jwt."
  }

  dynamic "rule" {
    for_each = var.PolicyMap
    content {
      path         = rule.key
      capabilities = rule.value
    }
  }
}

resource "vault_policy" "GitlabGroupPolicy" {
  name   = local.PolicyName
  policy = data.vault_policy_document.GitlabGroupPolicy.hcl
}

variable "PolicyMap" {
  description = "Map of paths to capabilites"
  type        = map(any)
}
