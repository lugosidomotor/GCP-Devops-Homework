apiVersion: v1
kind: Config
clusters:
- cluster:
    certificate-authority-data: ${cluster_ca_certificate}
    server: https://${endpoint}
  name: gke_${cluster_name}
contexts:
- context:
    cluster: gke_${cluster_name}
    user: gke_${cluster_name}
  name: gke_${cluster_name}
current-context: gke_${cluster_name}
users:
- name: gke_${cluster_name}
  user:
    token: ${token}
