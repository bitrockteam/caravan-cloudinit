variable "cluster_nodes" {
  type = map(any)
}
variable "vault_endpoint" {
  type = string
}
variable "dc_name" {
  type = string
}
variable "nodeType" {
  type    = string
  default = "worker"
}
variable "docker_volume_enable" {
  type        = bool
  default     = false
  description = "Allow mounting host paths outside of the allocation working directory"
}
variable "host_volumes" {
  type        = list(map(string))
  default     = []
  description = "Define a list of host_volume to make volumes available to jobs"
}
variable "base64" {
  type    = bool
  default = true
}
variable "gzip" {
  type    = bool
  default = true
}
variable "auto_auth_type" {
  type    = string
  default = ""
  validation {
    condition     = contains(toset(["aws", "oci", "gcp", "approle", "azure"]), var.auto_auth_type)
    error_message = "Unsupported auto_auth_type value. Supported values: gcp, oci, approle, aws, azure."
  }
}

variable "gcp_node_role" {
  type        = string
  default     = null
  description = "(optional) Configured GCP role of the node"
}
variable "gcp_service_account" {
  type        = string
  default     = null
  description = "(optional) Configured GCP service account"
}
variable "gcp_project_id" {
  type        = string
  default     = null
  description = "(optional) The GCP Project ID"
}
variable "oci_node_role" {
  type        = string
  default     = null
  description = "(optional) Configured OCI role of the node"
}

variable "aws_node_role" {
  type        = string
  default     = null
  description = "(optional) Configured AWS role of the node"
}
variable "aws_access_key" {
  type        = string
  default     = null
  description = "(optional) Static AWS Access Key credential for authentication"
}
variable "aws_secret_key" {
  type        = string
  default     = null
  description = "(optional) Static AWS Secret Key credential for authentication"
}

variable "azure_node_role" {
  type        = string
  default     = null
  description = "(optional) Configured Azure role of the node"
}
variable "azure_resource" {
  type        = string
  default     = "https://management.azure.com/"
  description = "(optional) A configured Azure AD application which is used as the resource for generating MSI access tokens"
}

variable "vault_persistent_device" {
  type        = string
  default     = ""
  description = "Device where to persist Caravan Vault data and configs"
}

variable "vault_home" {
  type        = string
  default     = "/etc/vault.d"
  description = "Vault home directory to be mounted"
}

variable "vault_data" {
  type        = string
  default     = "/var/lib/vault"
  description = "Vault data directory to be mounted"
}

variable "consul_persistent_device" {
  type        = string
  default     = ""
  description = "Device where to persist Caravan Consul data and configs"
}

variable "consul_home" {
  type        = string
  default     = "/etc/consul.d"
  description = "Consul home directory to be mounted"
}

variable "consul_data" {
  type        = string
  default     = "/var/lib/consul"
  description = "Consul data directory to be mounted"
}

variable "nomad_persistent_device" {
  type        = string
  default     = ""
  description = "Device where to persist Caravan Nomad data and configs"
}

variable "nomad_home" {
  type        = string
  default     = "/etc/nomad.d"
  description = "Nomad home directory to be mounted"
}

variable "nomad_data" {
  type        = string
  default     = "/var/lib/nomad"
  description = "Nomad data directory to be mounted"
}

variable "partition_prefix" {
  type        = string
  default     = ""
  description = "Partition prefix. like p or empty if /dev/nvme1n1p1 or /dev/sdd1"
}
