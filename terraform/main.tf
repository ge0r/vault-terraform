#------------------------------------------------------------------------------
# The best practice is to use remote state file and encrypt it since your
# state files may contains sensitive data (secrets).
#------------------------------------------------------------------------------
# terraform {
#       backend "s3" {
#             bucket = "remote-terraform-state-dev"
#             encrypt = true
#             key = "terraform.tfstate"
#             region = "us-east-1"
#       }
# }


# Use Vault provider
provider "vault" {
  # It is strongly recommended to configure this provider through the
  # environment variables:
  #    - VAULT_ADDR
  #    - VAULT_TOKEN
  #    - VAULT_CACERT
  #    - VAULT_CAPATH
  #    - etc.
}

# JWT auth backend config
resource "vault_jwt_auth_backend" "jwt" {
  path         = "jwt"
  jwks_url     = "http://mygitlab.internal/oauth/discovery/keys"
  bound_issuer = "http://mygitlab.internal"
}

# # JWT role config
resource "vault_jwt_auth_backend_role" "example-role" {
  backend         = vault_jwt_auth_backend.jwt.path
  role_name       = "zz-test-role"
  role_type       = "jwt"
  user_claim      = "sub"
  bound_audiences = ["https://localhost:8201"]
  bound_claims = {
    "project_id" : "2"
  }
}
