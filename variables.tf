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

variable "node_machine_type" {
  description = "The machine type for GKE nodes"
  type        = string
  default     = "n1-standard-1"
}
