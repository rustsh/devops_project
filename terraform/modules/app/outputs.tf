output "prod_external_ip" {
  value = "${google_compute_instance.prod_vm.network_interface.0.access_config.0.assigned_nat_ip}"
}

output "stage_external_ip" {
  value = "${google_compute_instance.stage_vm.network_interface.0.access_config.0.assigned_nat_ip}"
}
