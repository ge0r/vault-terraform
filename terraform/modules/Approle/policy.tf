data "vault_policy_document" "ApprolePolicy" {
  rule {
    path          = "auth/token/create"
    capabilities  = [ "update" ]
    description   = "Allow Access token updates"
  }
  
  dynamic "rule" {
    for_each = var.PolicyMap
    content {
      path         = rule.key
      capabilities = rule.value
    }
  }
}

resource "vault_policy" "ApprolePolicy" {
  name   = local.PolicyName
  policy = data.vault_policy_document.ApprolePolicy.hcl
}
