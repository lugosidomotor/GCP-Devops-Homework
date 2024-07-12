resource "google_storage_bucket" "bucket" {
  name          = var.bucket_name
  location      = var.location
  force_destroy = true
}

resource "random_string" "random_id" {
  length  = 5
  special = false
  upper   = false
}

resource "google_service_account" "sa" {
  account_id   = "streamlit-service-account-${random_string.random_id.result}"
  display_name = "Streamlit Service Account"
}

resource "google_storage_bucket_iam_member" "member" {
  bucket = google_storage_bucket.bucket.name
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.sa.email}"
}

output "bucket_name" {
  value = google_storage_bucket.bucket.name
}

output "service_account_email" {
  value = google_service_account.sa.email
}
