resource "google_compute_instance" "prod_vm" {
  name         = "prod"
  machine_type = "${var.app_machine_type}"
  zone         = "${var.zone}"
  tags         = ["devops", "devops-app"]

  boot_disk {
    initialize_params {
      image = "${var.app_disk_image}"
      type  = "${var.app_disk_type}"
      size  = "${var.app_disk_size}"
    }
  }

  network_interface {
    network = "${var.network}"

    access_config = {
      nat_ip = "${google_compute_address.prod_ip.address}"
    }
  }
}

resource "google_compute_instance" "stage_vm" {
  name         = "stage"
  machine_type = "${var.app_machine_type}"
  zone         = "${var.zone}"
  tags         = ["devops", "devops-app"]

  boot_disk {
    initialize_params {
      image = "${var.app_disk_image}"
      type  = "${var.app_disk_type}"
      size  = "${var.app_disk_size}"
    }
  }

  network_interface {
    network = "${var.network}"

    access_config = {
      nat_ip = "${google_compute_address.stage_ip.address}"
    }
  }
}

resource "google_compute_address" "prod_ip" {
  name = "prod-ip"
}

resource "google_compute_address" "stage_ip" {
  name = "stage-ip"
}
