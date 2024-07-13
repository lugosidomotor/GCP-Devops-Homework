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

variable "node_machine_type" {
  description = "The machine type for GKE nodes"
  type        = string
  default     = "n1-standard-1"
}
