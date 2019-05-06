output "monitor_external_ip" {
  value = "${google_compute_instance.monitor_vm.network_interface.0.access_config.0.assigned_nat_ip}"
}
