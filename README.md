# Caravan CloudInit

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudinit"></a> [cloudinit](#provider\_cloudinit) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudinit_config.control_plane](https://registry.terraform.io/providers/hashicorp/cloudinit/latest/docs/data-sources/config) | data source |
| [cloudinit_config.monitoring](https://registry.terraform.io/providers/hashicorp/cloudinit/latest/docs/data-sources/config) | data source |
| [cloudinit_config.worker_plane](https://registry.terraform.io/providers/hashicorp/cloudinit/latest/docs/data-sources/config) | data source |
| [cloudinit_config.worker_plane_startup_script](https://registry.terraform.io/providers/hashicorp/cloudinit/latest/docs/data-sources/config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
<<<<<<< HEAD
| <a name="input_cluster_nodes"></a> [cluster\_nodes](#input\_cluster\_nodes) | n/a | `map(any)` | n/a | yes |
| <a name="input_dc_name"></a> [dc\_name](#input\_dc\_name) | n/a | `string` | n/a | yes |
| <a name="input_vault_endpoint"></a> [vault\_endpoint](#input\_vault\_endpoint) | n/a | `string` | n/a | yes |
| <a name="input_auto_auth_type"></a> [auto\_auth\_type](#input\_auto\_auth\_type) | n/a | `string` | `""` | no |
| <a name="input_aws_access_key"></a> [aws\_access\_key](#input\_aws\_access\_key) | (optional) Static AWS Access Key credential for authentication | `string` | `null` | no |
| <a name="input_aws_node_role"></a> [aws\_node\_role](#input\_aws\_node\_role) | (optional) Configured AWS role of the node | `string` | `null` | no |
| <a name="input_aws_secret_key"></a> [aws\_secret\_key](#input\_aws\_secret\_key) | (optional) Static AWS Secret Key credential for authentication | `string` | `null` | no |
| <a name="input_azure_node_role"></a> [azure\_node\_role](#input\_azure\_node\_role) | (optional) Configured Azure role of the node | `string` | `null` | no |
| <a name="input_azure_resource"></a> [azure\_resource](#input\_azure\_resource) | (optional) A configured Azure AD application which is used as the resource for generating MSI access tokens | `string` | `"https://management.azure.com/"` | no |
| <a name="input_base64"></a> [base64](#input\_base64) | n/a | `bool` | `true` | no |
| <a name="input_docker_volume_enable"></a> [docker\_volume\_enable](#input\_docker\_volume\_enable) | Allow mounting host paths outside of the allocation working directory | `bool` | `false` | no |
| <a name="input_gcp_node_role"></a> [gcp\_node\_role](#input\_gcp\_node\_role) | (optional) Configured GCP role of the node | `string` | `null` | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | (optional) The GCP Project ID | `string` | `null` | no |
| <a name="input_gcp_service_account"></a> [gcp\_service\_account](#input\_gcp\_service\_account) | (optional) Configured GCP service account | `string` | `null` | no |
| <a name="input_gzip"></a> [gzip](#input\_gzip) | n/a | `bool` | `true` | no |
| <a name="input_host_volumes"></a> [host\_volumes](#input\_host\_volumes) | Define a list of host\_volume to make volumes available to jobs | `list(map(string))` | `[]` | no |
| <a name="input_nodeType"></a> [nodeType](#input\_nodeType) | n/a | `string` | `"worker"` | no |
| <a name="input_oci_node_role"></a> [oci\_node\_role](#input\_oci\_node\_role) | (optional) Configured OCI role of the node | `string` | `null` | no |
| <a name="input_persistent_device"></a> [persistent\_device](#input\_persistent\_device) | Device where to persist caravan data | `string` | `""` | no |
=======
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
| consul\_persistent\_device | Device where to persist Caravan Consul data and configs | `string` | `""` | no |
| docker\_volume\_enable | Allow mounting host paths outside of the allocation working directory | `bool` | `false` | no |
| gcp\_node\_role | (optional) Configured GCP role of the node | `string` | `null` | no |
| gcp\_project\_id | (optional) The GCP Project ID | `string` | `null` | no |
| gcp\_service\_account | (optional) Configured GCP service account | `string` | `null` | no |
| gzip | n/a | `bool` | `true` | no |
| host\_volumes | Define a list of host\_volume to make volumes available to jobs | `list(map(string))` | `[]` | no |
| nodeType | n/a | `string` | `"worker"` | no |
| nomad\_persistent\_device | Device where to persist Caravan Nomad data and configs | `string` | `""` | no |
| oci\_node\_role | (optional) Configured OCI role of the node | `string` | `null` | no |
| vault\_persistent\_device | Device where to persist Caravan Vault data and configs | `string` | `""` | no |
>>>>>>> b41c21c (Multiple disk)

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_control_plane_user_data"></a> [control\_plane\_user\_data](#output\_control\_plane\_user\_data) | n/a |
| <a name="output_monitoring_user_data"></a> [monitoring\_user\_data](#output\_monitoring\_user\_data) | n/a |
| <a name="output_worker_plane_startup_script"></a> [worker\_plane\_startup\_script](#output\_worker\_plane\_startup\_script) | n/a |
| <a name="output_worker_plane_user_data"></a> [worker\_plane\_user\_data](#output\_worker\_plane\_user\_data) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
