#---------------------
# Create policies
#---------------------

# Create admin policy in the root namespace
resource "vault_policy" "admin_policy" {
  name   = "admins"
  policy = file("policies/admin-policy.hcl")
}

# Create 'training' policy
resource "vault_policy" "eaas-client" {
  name   = "eaas-client"
  policy = file("policies/eaas-client-policy.hcl")
}

resource "vault_policy" "system_vault_config" {
  name   = "system_vault_config"
  policy = file("policies/system_vault_config.hcl")
}

resource "vault_policy" "system_jwt_vault_config" {
  name   = "system_jwt_vault_config"
  policy = file("policies/system_jwt_vault_config.hcl")
}
