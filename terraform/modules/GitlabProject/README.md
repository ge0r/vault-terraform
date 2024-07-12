# Vault-gitlab-project terraform-module

[[_TOC_]]

This Module creates all required ressources for a Gitlab project to retrieve secrets from Vault.
The module creates:

- JWT Auth for gitlab-ci
- AppRole login for use by terraform
- policy for the gitlab-ci to access relevant secrets from vault

## NAMING CONVENTIONS

```preformated
$GitlabProjectId-$GitlabProjectName-$ProjectStage
ProjectId = Gitlab Project Id
Projectname = Gitlab Project Name
ProjectStage = FREEform usually contains prod | dev | stage or something alike
```

## Role - Policy relation

For each Gitlab Project there are the following ressources created

- One JWT Auth Role in the default JWT Auth Backend
 the JWT Auth is used by the Gitlab CI to Authenticate
- One AppRole Auth in the default AppRole Auth Backend
 The AppRole is needed by terraform to Authenticate
- One Policy governing access to all Paths that the Gitlab CI needs access to

## Example usage

Create a .tf file describing the gitlab project to create a integration for

```hcl
module "app_bis_ec-infra_stage" {     # The name of the module. must be uniq
  source = "../modules/GitlabProject" # where the module is located

  GitlabProjectId   = "42"
  ProjectStage      = "development"
  PolicyMap = {
    "secret-engine/to/allow/1" = ["list","read","create","update", "delete","sudo"]
    "secret-engine/to/allow/2" = ["list","read","create","update", "delete","sudo"]
  }
}
```

## module description

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_approle_auth_backend_login.login](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/approle_auth_backend_login) | resource |
| [vault_approle_auth_backend_role.tf-ci-token-approle](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/approle_auth_backend_role) | resource |
| [vault_approle_auth_backend_role_secret_id.id](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/approle_auth_backend_role_secret_id) | resource |
| [vault_generic_secret.approle](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_secret) | resource |
| [vault_jwt_auth_backend_role.jwt](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/jwt_auth_backend_role) | resource |
| [vault_policy.GitlabProjectPolicy](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_approle_auth_backend_role_id.role](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/approle_auth_backend_role_id) | data source |
| [vault_policy_document.GitlabProjectPolicy](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_GitlabProjectId"></a> [GitlabProjectId](#input\_GitlabProjectId) | The id of the gitlab project. | `string` | n/a | yes |
| <a name="input_PolicyMap"></a> [PolicyMap](#input\_PolicyMap) | Map of paths to capabilites | `map(any)` | n/a | yes |
| <a name="input_ProjectStage"></a> [ProjectStage](#input\_ProjectStage) | The name of the targeted environment. | `string` | n/a | yes |

## Outputs

No outputs.