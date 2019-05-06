resource "google_compute_instance" "monitor_vm" {
  name         = "monitor"
  machine_type = "${var.monitor_machine_type}"
  zone         = "${var.zone}"
  tags         = ["devops", "devops-monitor"]

  boot_disk {
    initialize_params {
      image = "${var.monitor_disk_image}"
      type  = "${var.monitor_disk_type}"
      size  = "${var.monitor_disk_size}"
    }
  }

  network_interface {
    network = "${var.network}"

    access_config = {
      nat_ip = "${google_compute_address.monitor_ip.address}"
    }
  }
}

resource "google_compute_address" "monitor_ip" {
  name = "monitor-ip"
}
