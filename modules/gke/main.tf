resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  networking {
    network    = var.network
    subnetwork = var.subnetwork
  }

  remove_default_node_pool = true

  initial_node_count = 1
}

resource "google_container_node_pool" "primary_nodes" {
  cluster    = google_container_cluster.primary.name
  location   = var.region
  node_count = 1

  node_config {
    preemptible  = false
    machine_type = "n1-standard-1"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

output "cluster_name" {
  value = google_container_cluster.primary.name
}
