provider "google" {
  project = var.project_id
  region  = var.region
}

provider "kubernetes" {
  config_path = "${path.module}/kubeconfig"
}

provider "helm" {
  kubernetes {
    config_path = "${path.module}/kubeconfig"
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
}

module "storage" {
  source      = "./modules/storage"
  project_id  = var.project_id
  bucket_name = "streamlit-bucket-${random_id.bucket_id.hex}"
}

# Generate kubeconfig file
resource "local_file" "kubeconfig" {
  content  = templatefile("${path.module}/kubeconfig.tpl", {
    cluster_name = google_container_cluster.primary.name
    endpoint     = google_container_cluster.primary.endpoint
    cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth.0.cluster_ca_certificate)
    token        = data.google_client_config.default.access_token
  })
  filename = "${path.module}/kubeconfig"
}

data "google_client_config" "default" {}

# Deploy Streamlit using Helm
resource "helm_release" "streamlit" {
  name       = "streamlit"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "streamlit"
  namespace  = "default"
  depends_on = [local_file.kubeconfig]
}

# Deploy MLflow using Helm
resource "helm_release" "mlflow" {
  name       = "mlflow"
  repository = "https://charts.helm.sh/stable"
  chart      = "mlflow"
  namespace  = "default"
  depends_on = [local_file.kubeconfig]
}

resource "random_id" "bucket_id" {
  byte_length = 8
}
