# Vault generic approle terraform-module

[[_TOC_]]

This Module creates all required ressources for a Approle to retrieve secrets from Vault.
The coresponding Secret will be written to vault. 

The module creates:

- AppRole login for general use
- policy for the approle 

## NAMING CONVENTIONS

Here are no whitespaces allowed!

```preformated
$department-$usecase-$stage
department = TeamIT
usecase    = automatebot
stage      = FREEform usually contains prod | dev | stage or something alike
```

## Role - Policy relation

For each Usecase there are the following ressources created

- One AppRole Auth in the default AppRole Auth Backend
 The AppRole is needed to Authenticate
- One Policy governing access to all Paths that the usecase needs access to

## Example usage

Create a .tf file describing the usecase to create a integration for

```hcl
module "app_it_automation_dev" {       # The name of the module. must be uniq
  source = "../modules/Approle"        # where the module is located

  department   = "TeamIT"
  usecase      = "automation"
  stage        = "dev"
  mountpath    = "it"     # the mount path where the credentials will be stored use a existing secret engine
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
| [vault_approle_auth_backend_role.tf-ci-token-approle](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/approle_auth_backend_role) | resource |
| [vault_approle_auth_backend_role_secret_id.id](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/approle_auth_backend_role_secret_id) | resource |
| [vault_generic_secret.approle](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_secret) | resource |
| [vault_policy.ApprolePolicy](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_approle_auth_backend_role_id.role](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/approle_auth_backend_role_id) | data source |
| [vault_policy_document.ApprolePolicy](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_department"></a> [department](#input\_department) | The department for this approle. | `string` | n/a | yes |
| <a name="input_PolicyMap"></a> [PolicyMap](#input\_PolicyMap) | Map of paths to capabilites | `map(any)` | n/a | yes |
| <a name="input_Stage"></a> [Stage](#input\_Stage) | The name of the targeted environment. | `string` | n/a | yes |
| <a name="input_usecase"></a> [usecase](#input\_usecase) | The name usecase of this approle. | `string` | n/a | yes |
| <a name="input_mountpath"></a> [mountpath](#input\_mountpath) | The mount path to write back the approle secret. | `string` | n/a | yes |

## Outputs

No outputs.