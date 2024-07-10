variable "project_id" {
  description = "The ID of the GCP project"
  type        = string
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
  default     = "us-central1"
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

variable "bucket_name" {
  description = "Name of the GCS bucket"
  type        = string
  default     = "streamlit-bucket-${random_id.bucket_id.hex}"
}
