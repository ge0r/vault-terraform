module "app_test_pipeline_sign" {
  source = "./modules/GitlabProject"

  jwt_auth_backend_path = vault_jwt_auth_backend.jwt.path
  GitlabProjectId       = "1"
  BoundClaimsIdentifier = "sign"
  ProjectStage          = "prod"
  PolicyMap = {
    "kv-v2/data/test"            = ["read"]
    "kv-v2/data/certs/test-cert" = ["read"]
  }
  BoundClaims = {
    "ref"           = "main"
    "ref_protected" = "true"
  }
}

module "app_test_pipeline_test" {
  source = "./modules/GitlabProject"

  jwt_auth_backend_path = vault_jwt_auth_backend.jwt.path
  GitlabProjectId       = "1"
  BoundClaimsIdentifier = "test"
  ProjectStage          = "prod"
  PolicyMap = {
    "kv-v2/data/test" = ["read"]
  }
  BoundClaims = {
    "ref_protected" = "false"
  }
}

module "app_test_pipeline" {
  source = "./modules/GitlabProject"

  jwt_auth_backend_path = vault_jwt_auth_backend.jwt.path
  GitlabProjectId       = "1"
  ProjectStage          = "prod"
  PolicyMap = {
    "kv-v2/data/test" = ["read"]
  }
}
