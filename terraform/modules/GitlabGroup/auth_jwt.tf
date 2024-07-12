resource "vault_jwt_auth_backend_role" "jwt" {
  role_name             = local.jwtAuthRoleName
  token_policies        = [local.PolicyName]
  bound_audiences       = []
  user_claim            = "user_email"
  role_type             = "jwt"
  allowed_redirect_uris = null
  bound_claims = {
    "namespace_id" : var.GitlabNamespaceId,
  }
  bound_claims_type       = "glob"
  token_explicit_max_ttl  = 15
  token_no_default_policy = false
}
