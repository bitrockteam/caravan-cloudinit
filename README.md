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
| <a name="input_consul_data"></a> [consul\_data](#input\_consul\_data) | Consul data directory to be mounted | `string` | `"/var/lib/consul"` | no |
| <a name="input_consul_home"></a> [consul\_home](#input\_consul\_home) | Consul home directory to be mounted | `string` | `"/etc/consul.d"` | no |
| <a name="input_consul_persistent_device"></a> [consul\_persistent\_device](#input\_consul\_persistent\_device) | Device where to persist Caravan Consul data and configs | `string` | `""` | no |
| <a name="input_docker_volume_enable"></a> [docker\_volume\_enable](#input\_docker\_volume\_enable) | Allow mounting host paths outside of the allocation working directory | `bool` | `false` | no |
| <a name="input_gcp_node_role"></a> [gcp\_node\_role](#input\_gcp\_node\_role) | (optional) Configured GCP role of the node | `string` | `null` | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | (optional) The GCP Project ID | `string` | `null` | no |
| <a name="input_gcp_service_account"></a> [gcp\_service\_account](#input\_gcp\_service\_account) | (optional) Configured GCP service account | `string` | `null` | no |
| <a name="input_gzip"></a> [gzip](#input\_gzip) | n/a | `bool` | `true` | no |
| <a name="input_host_volumes"></a> [host\_volumes](#input\_host\_volumes) | Define a list of host\_volume to make volumes available to jobs | `list(map(string))` | `[]` | no |
| <a name="input_nodeType"></a> [nodeType](#input\_nodeType) | n/a | `string` | `"worker"` | no |
| <a name="input_nomad_data"></a> [nomad\_data](#input\_nomad\_data) | Nomad data directory to be mounted | `string` | `"/var/lib/nomad"` | no |
| <a name="input_nomad_home"></a> [nomad\_home](#input\_nomad\_home) | Nomad home directory to be mounted | `string` | `"/etc/nomad.d"` | no |
| <a name="input_nomad_persistent_device"></a> [nomad\_persistent\_device](#input\_nomad\_persistent\_device) | Device where to persist Caravan Nomad data and configs | `string` | `""` | no |
| <a name="input_oci_node_role"></a> [oci\_node\_role](#input\_oci\_node\_role) | (optional) Configured OCI role of the node | `string` | `null` | no |
| <a name="input_partition_prefix"></a> [partition\_prefix](#input\_partition\_prefix) | Partition prefix. like p or empty if /dev/nvme1n1p1 or /dev/sdd1 | `string` | `""` | no |
| <a name="input_vault_data"></a> [vault\_data](#input\_vault\_data) | Vault data directory to be mounted | `string` | `"/var/lib/vault"` | no |
| <a name="input_vault_home"></a> [vault\_home](#input\_vault\_home) | Vault home directory to be mounted | `string` | `"/etc/vault.d"` | no |
| <a name="input_vault_persistent_device"></a> [vault\_persistent\_device](#input\_vault\_persistent\_device) | Device where to persist Caravan Vault data and configs | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_control_plane_user_data"></a> [control\_plane\_user\_data](#output\_control\_plane\_user\_data) | n/a |
| <a name="output_monitoring_user_data"></a> [monitoring\_user\_data](#output\_monitoring\_user\_data) | n/a |
| <a name="output_worker_plane_startup_script"></a> [worker\_plane\_startup\_script](#output\_worker\_plane\_startup\_script) | n/a |
| <a name="output_worker_plane_user_data"></a> [worker\_plane\_user\_data](#output\_worker\_plane\_user\_data) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
