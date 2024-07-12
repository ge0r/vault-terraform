resource "vault_jwt_auth_backend_role" "jwt" {
  for_each = var.PolicyMap

  backend                 = var.jwt_auth_backend_path
  role_name               = local.jwtAuthRoleName
  token_policies          = [local.PolicyName]
  bound_audiences         = ["https://localhost:8201"]
  user_claim              = "user_email"
  role_type               = "jwt"
  allowed_redirect_uris   = null
  token_explicit_max_ttl  = 15
  token_no_default_policy = false
  bound_claims_type       = "glob"

  bound_claims = merge(
    {
      "project_id" : var.GitlabProjectId,
    },
    lookup(var.BoundClaims, each.key, {})
  )
}
