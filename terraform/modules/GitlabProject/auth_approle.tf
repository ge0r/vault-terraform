resource "vault_approle_auth_backend_role" "tf-ci-token-approle" {
  role_name      = local.approleAuthRoleName
  token_policies = [local.PolicyName]
}

resource "vault_approle_auth_backend_role_secret_id" "id" {
  role_name = vault_approle_auth_backend_role.tf-ci-token-approle.role_name
}

data "vault_approle_auth_backend_role_id" "role" {
  role_name = local.approleAuthRoleName
}

## Write Approle to Vault
resource "vault_generic_secret" "approle" {
  path = "gitlab-approles/${local.approleSecretPath}"

  data_json = <<EOT
  {
    "id":  "${vault_approle_auth_backend_role.tf-ci-token-approle.role_id}",
    "secret": "${vault_approle_auth_backend_role_secret_id.id.secret_id}",
    "accessor": "${vault_approle_auth_backend_role_secret_id.id.accessor}"
  }
EOT
}
