variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "network" {
  type = string
}

variable "subnetwork" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "gpu_node_required" {
  description = "Whether GPU nodes are required"
  type        = bool
  default     = false
}

variable "default_node_type" {
  description = "Default machine type for non-GPU nodes"
  type        = string
  default     = "n1-standard-2"
}

variable "gpu_node_type" {
  description = "Machine type for GPU nodes"
  type        = string
  default     = "n1-standard-4" # This is just an example, choose an appropriate GPU-enabled machine type
}

variable "service_account_email" {
  description = "The email of the service account to be used by the node pool"
  type        = string
}
