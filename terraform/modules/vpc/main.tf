resource "google_compute_network" "vpc_network" {
  name                    = "devops-project-network"
  auto_create_subnetworks = "true"
}

resource "google_compute_firewall" "firewall_devops_all" {
  name    = "allow-devops-project-all"
  network = "${google_compute_network.vpc_network.self_link}"

  allow {
    protocol = "tcp"

    ports = ["8000", "80", "443", "22", "2222"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["devops"]
}

resource "google_compute_firewall" "firewall_devops_monitor" {
  name    = "allow-devops-project-monitor"
  network = "${google_compute_network.vpc_network.self_link}"

  allow {
    protocol = "tcp"

    ports = ["9090","3000", "9093"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["devops-monitor"]
}

resource "google_compute_firewall" "firewall_devops_exporters" {
  name    = "allow-devops-project-exporters"
  network = "${google_compute_network.vpc_network.self_link}"

  allow {
    protocol = "tcp"

    ports = ["9100", "9419", "8080"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["devops-app"]
}
