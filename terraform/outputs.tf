output "prod_external_ip" {
  value = "${module.app.prod_external_ip}"
}

output "stage_external_ip" {
  value = "${module.app.stage_external_ip}"
}

output "ci_external_ip" {
  value = "${module.ci.ci_external_ip}"
}

output "monitor_external_ip" {
  value = "${module.monitor.monitor_external_ip}"
}

output "network" {
  value = "${module.vpc.network}"
}
