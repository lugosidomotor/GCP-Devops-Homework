resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  network    = var.network
  subnetwork = var.subnetwork

  remove_default_node_pool = true

  initial_node_count = 1
}

resource "google_container_node_pool" "primary_nodes" {
  cluster    = google_container_cluster.primary.name
  location   = var.region
  node_count = 1

  node_config {
    preemptible     = false
    machine_type    = var.gpu_node_required ? var.gpu_node_type : var.default_node_type
    service_account = var.service_account_email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    dynamic "guest_accelerator" {
      for_each = var.gpu_node_required ? [1] : []
      content {
        type  = "nvidia-tesla-t4" # You can change this to the specific GPU type you need
        count = 1
      }
    }
  }
}
