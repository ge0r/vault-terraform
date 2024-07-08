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
  path     = "jwt"
  jwks_url = "https://mygitlab.internal/oauth/discovery/keys"
  # oidc_discovery_url = "https://mygitlab.internal"
  # jwks_ca_pem        = "./mygitlab.internal.crt"
  # oidc_discovery_ca_pem = "./mygitlab.internal.crt"
  # jwt_validation_pubkeys = [
  # <<-EOT
  # -----BEGIN PUBLIC KEY-----
  # MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAyTkeuK/4afe6bsJ2ChGG
  # QkMmcCKxfZxxf185PkurUkUTJGovESoDao9DbolSah04c+/xsN9G6s3FVzW7Kbsw
  # dmFEO6/Q+e9R1VeCFTshNDgBRApy7tXqNHv9ofR5y+L5G66uf201ew2fXubymYzv
  # zZ4lyYaLmfzMZSqzfP2qj9Mt+HO0mu7uT95jBfC4gUBhX0A5vjAkO7KnDx12InHb
  # t5DDRHN/GxzPo2gwaBXAUzuYTULeI//2RZV2x+Hn8xAfgNiyUVqJXm6gNnZIYjsC
  # DXWDgFPD+JO9p7S5eXByGucLFWuuOVZaqq09x09JzDdmWlxK3+CuQmnkyoqNpzDf
  # hNdRzManr3oGmmdXuDVzuyPNgscwzZ/Pt/aLuqm+PMZ/aGouVpGawd7DYinWwu5e
  # Oce3hPl/51co09ayyvCW7MmderVWk5tAGgKAAAjHgm+1cLTvlU715gcqtOrw7F/v
  # I99Q1vnNpBmcsIIvWZXbYVm03AJEwkhCHQ4sh5nPra6m0XjhUSsIGlfmzbtV2LNG
  # +6Hx5CAKgr8UpjV1VFHPJWPtz1r0D6+dquJvUcyU91nsn2sYmJ3Xl5xcF8VSywla
  # pEmgYWZ+xlsxpQERyqwfIjooE1wUI0hQ7ZHgN/rm3P1mJ65d6snWQYWvMvKAa5DO
  # oOspuiPZSwNJFr0akYihYF0CAwEAAQ==
  # -----END PUBLIC KEY-----
  # EOT,
  # <<-EOT
  # -----BEGIN PUBLIC KEY-----
  # MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAs9g8M3g2mPUZhprKaFCX
  # mgZbRBaORhVHZOUsxWsvVkKRGE4pQqbgatQJDmsR0eyQH1T57g6cGY1bHPJSgK76
  # 8aFu0Zg8Y5CMioMa8Y1cjCCC/ZscGkpS85UnNpcqOWZwrXTAXbCzT02HqAp11ur4
  # lyZyf0OYjLyrh8G1kHk7ypoJbrNWeol4h6Iky1NH3rdabX9StB3qZf1BXOm10wiR
  # dyhFanQ6d5OtragLiaAQqywPb7Ci4aIKTgBUqZ9qK0QrD9988pVEB2E4BqrL6Sy1
  # /P4SOoRoLZh78DgBeXXSIbXdLmXsCaif8UGdTqDij6ekLEb8Sz89WZS1N2XnkG9a
  # +QIDAQAB
  # -----END PUBLIC KEY-----
  # EOT
  # ]
  # bound_issuer = "https://mygitlab.internal"
}

# # JWT role config
# resource "vault_jwt_auth_backend_role" "example-role" {
#   backend         = vault_jwt_auth_backend.jwt.path
#   role_name       = "zz-test-role"
#   role_type       = "jwt"
#   user_claim      = "sub"
#   bound_audiences = []
#   bound_claims = {
#     "project_id" : "1"
#   }
# }
