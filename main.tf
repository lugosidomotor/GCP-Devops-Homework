provider "google" {
  project = var.project_id
  region  = var.region
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
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
  cluster_name    = var.cluster_name
  network         = module.network.network_name
  subnetwork      = module.network.subnetwork_name
}

module "storage" {
  source      = "./modules/storage"
  project_id  = var.project_id
  bucket_name = "streamlit-bucket-${random_id.bucket_id.hex}"
}

resource "random_id" "bucket_id" {
  byte_length = 8
}
