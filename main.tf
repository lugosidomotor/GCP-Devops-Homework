provider "google" {
  project = var.project_id
  region  = var.region
}

data "google_container_cluster" "my_cluster" {
  name     = var.cluster_name
  location = var.region

  depends_on = [module.gke]
}

data "google_client_config" "default" {}

provider "kubernetes" {
  host  = "https://${data.google_container_cluster.my_cluster.endpoint}"
  token = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate
  )
}

provider "helm" {
  kubernetes {
    host  = "https://${data.google_container_cluster.my_cluster.endpoint}"
    token = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(
      data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate
    )
  }
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
  node_machine_type = var.node_machine_type
}

resource "random_id" "bucket_id" {
  byte_length = 8
}

module "storage" {
  source      = "./modules/storage"
  project_id  = var.project_id
  bucket_name = "streamlit-bucket-${random_id.bucket_id.hex}"
}

resource "helm_release" "streamlit" {
  name       = "streamlit"
  repository = "https://samdobson.github.io/helm"
  chart      = "streamlit"
  namespace  = "default"

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
}

resource "helm_release" "mlflow" {
  name       = "mlflow"
  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "mlflow"
  namespace  = "default"

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "tracking.service.type"
    value = "LoadBalancer"
  }
}
