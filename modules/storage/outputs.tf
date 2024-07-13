output "service_account_email" {
  value = google_service_account.sa.email
}

output "bucket_name" {
  value = google_storage_bucket.bucket.name
}
