module "test_pipeline_proj" {
  source = "./modules/GitlabProject"

  GitlabProjectId = "1"
  ProjectStage    = "prod"
  PolicyMap = {
    "kv-v2/data/test" = ["read"]
  }
}
