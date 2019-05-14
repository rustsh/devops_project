provider "google" {
  version = "1.20.0"
  project = "${var.project}"
  region  = "${var.region}"
}

resource "google_storage_bucket" "backend-store" {
  name          = "devops-project-storage-bucket"
  force_destroy = true
}
