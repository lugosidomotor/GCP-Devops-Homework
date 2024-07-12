terraform {
  required_version = ">= 0.13"

  backend "gcs" {
    bucket  = "PLACEHOLDER"
    prefix  = "PLACEHOLDER"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.5.0"
    }
  }
}
