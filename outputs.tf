output "cluster_name" {
  value = nonsensitive(module.gke.cluster_name)
}

output "endpoint" {
  value = nonsensitive(module.gke.endpoint)
}
