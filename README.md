# Caravan CloudInit

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| cloudinit | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [cloudinit_config](https://registry.terraform.io/providers/hashicorp/cloudinit/latest/docs/data-sources/config) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_nodes | n/a | `map(any)` | n/a | yes |
| dc\_name | n/a | `string` | n/a | yes |
| vault\_endpoint | n/a | `string` | n/a | yes |
| auto\_auth\_type | n/a | `string` | `""` | no |
| aws\_access\_key | (optional) Static AWS Access Key credential for authentication | `string` | `null` | no |
| aws\_node\_role | (optional) Configured AWS role of the node | `string` | `null` | no |
| aws\_secret\_key | (optional) Static AWS Secret Key credential for authentication | `string` | `null` | no |
| azure\_node\_role | (optional) Configured Azure role of the node | `string` | `null` | no |
| azure\_resource | (optional) A configured Azure AD application which is used as the resource for generating MSI access tokens | `string` | `"https://management.azure.com/"` | no |
| base64 | n/a | `bool` | `true` | no |
| docker\_volume\_enable | Allow mounting host paths outside of the allocation working directory | `bool` | `false` | no |
| gcp\_node\_role | (optional) Configured GCP role of the node | `string` | `null` | no |
| gcp\_project\_id | (optional) The GCP Project ID | `string` | `null` | no |
| gcp\_service\_account | (optional) Configured GCP service account | `string` | `null` | no |
| gzip | n/a | `bool` | `true` | no |
| host\_volumes | Define a list of host\_volume to make volumes available to jobs | `list(map(string))` | `[]` | no |
| nodeType | n/a | `string` | `"worker"` | no |
| oci\_node\_role | (optional) Configured OCI role of the node | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| control\_plane\_user\_data | n/a |
| monitoring\_user\_data | n/a |
| worker\_plane\_startup\_script | n/a |
| worker\_plane\_user\_data | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
