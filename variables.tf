variable "project_id" {
  description = "The ID of the GCP project"
  type        = string
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
  default     = "us-west1"
}

variable "network_name" {
  description = "Name of the network"
  type        = string
  default     = "default-network"
}

variable "subnetwork_name" {
  description = "Name of the subnetwork"
  type        = string
  default     = "default-subnetwork"
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
  default     = "streamlit-cluster"
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
  default     = "n1-standard-4"  # This is just an example, choose an appropriate GPU-enabled machine type
}
