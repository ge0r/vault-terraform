# Configure auth methods
path "sys/auth" {
  capabilities = ["read", "list"]
}

# Configure auth methods
path "sys/auth/*" {
  capabilities = ["create", "update", "read", "delete", "list", "sudo"]
}

# Create and manage entities and groups
path "identity/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# token update for terraform
path "auth/token/create" {
  capabilities = ["update"]
}

path "auth/token/lookup-accessor" {
  capabilities = ["update"]
}

# create jwt-roles
path "auth/jwt/role/tf-jwt-*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# create ldap auth backends
path "auth/ldap/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# create AppRole Roles
path "auth/approle/role/tf-app-*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Create and manage ACL policies
path "sys/policies/acl/tf-pol-*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Create and manage secret engines broadly across Vault.
path "sys/mounts/gitlab-approles" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Allow access to the Approle secret mount
path "gitlab-approles/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Allow to write approles in datascience mount
path "datascience/data/tf-approles/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Allow to write approles in it mount
path "it/data/tf-approles/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Create and manage Mounts
path "sys/mounts/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List all Mounts
path "sys/mounts" {
  capabilities = ["read", "list"]
}

# allow changing audit endpoints
path "sys/audit/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# allow reading to sys/audit
path "sys/audit" {
  capabilities = ["read", "sudo"]
}
