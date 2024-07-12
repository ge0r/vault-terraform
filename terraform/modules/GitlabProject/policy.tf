data "vault_policy_document" "GitlabProjectPolicy" {
  rule {
    path         = "auth/token/create"
    capabilities = ["update"]
    description  = "Allow Access token updates"
  }
  rule {
    path         = "role/data/${local.approleSecretPath}"
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

resource "vault_policy" "GitlabProjectPolicy" {
  name   = local.PolicyName
  policy = data.vault_policy_document.GitlabProjectPolicy.hcl
}
