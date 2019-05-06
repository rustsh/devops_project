resource "google_compute_instance" "ci_vm" {
  name         = "ci"
  machine_type = "${var.ci_machine_type}"
  zone         = "${var.zone}"
  tags         = ["devops", "devops-ci"]

  boot_disk {
    initialize_params {
      image = "${var.ci_disk_image}"
      type  = "${var.ci_disk_type}"
      size  = "${var.ci_disk_size}"
    }
  }

  network_interface {
    network = "${var.network}"

    access_config = {
      nat_ip = "${google_compute_address.ci_ip.address}"
    }
  }
}

resource "google_compute_address" "ci_ip" {
  name = "ci-ip"
}
