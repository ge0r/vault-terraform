# access approle secrets for terraform vault config ci from jwt-auth

path "it/data/vault-terraform/staging" {
  capabilities = ["read"]
}

path "it/data/vault-terraform/prod" {
  capabilities = ["read"]
}
