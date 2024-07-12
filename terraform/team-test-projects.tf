module "app_test_pipeline" {
  source = "./modules/GitlabProject"

  jwt_auth_backend_path = vault_jwt_auth_backend.jwt.path
  GitlabProjectId       = "1"
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
