output "gke_cluster_name" {
  description = "The name of the GKE cluster"
  value       = module.gke.cluster_name
}

output "bucket_name" {
  description = "The name of the GCS bucket"
  value       = module.storage.bucket_name
}
