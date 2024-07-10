provider "google" {
  project = var.project_id
  region  = var.region
}

module "network" {
  source         = "./modules/network"
  project_id     = var.project_id
  region         = var.region
  network_name   = var.network_name
  subnetwork_name = var.subnetwork_name
}

module "gke" {
  source          = "./modules/gke"
  project_id      = var.project_id
  region          = var.region
  network         = module.network.network_name
  subnetwork      = module.network.subnetwork_name
}

module "storage" {
  source      = "./modules/storage"
  project_id  = var.project_id
  bucket_name = var.bucket_name
}

output "gke_cluster_name" {
  value = module.gke.cluster_name
}

output "bucket_name" {
  value = module.storage.bucket_name
}
