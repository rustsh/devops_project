resource "google_compute_network" "vpc_network" {
  name                    = "devops-project-network"
  auto_create_subnetworks = "true"
}

resource "google_compute_firewall" "firewall_devops_app" {
  name    = "allow-devops-project-app"
  network = "${google_compute_network.vpc_network.self_link}"

  allow {
    protocol = "tcp"

    ports = ["8000", "80", "443", "22", "2222"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["devops", "devops-app"]
}

resource "google_compute_firewall" "firewall_devops_monitor" {
  name    = "allow-devops-project-monitor"
  network = "${google_compute_network.vpc_network.self_link}"

  allow {
    protocol = "tcp"

    ports = ["9090","3000", "9100", "9419", "8080", "80", "443", "22", "2222"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["devops", "devops-monitor"]
}
