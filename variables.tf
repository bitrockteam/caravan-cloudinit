variable "cluster_nodes" {
  type = map(any)
}
variable "vault_endpoint" {
  type = string
}
variable "dc_name" {
  type = string
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
  default     = null
  description = "(optional) A configured Azure AD application which is used as the resource for generating MSI access tokens"
}
