provider "google" {
  version = "1.20.0"
  project = "${var.project}"
  region  = "${var.region}"
}

module "vpc" {
  source = "modules/vpc"
}

module "app" {
  source           = "modules/app"
  zone             = "${var.zone}"
  network          = "${module.vpc.network}"
  app_machine_type = "${var.app_machine_type}"
  app_disk_image   = "${var.app_disk_image}"
  app_disk_type    = "${var.app_disk_type}"
  app_disk_size    = "${var.app_disk_size}"
}

module "ci" {
  source          = "modules/ci"
  zone            = "${var.zone}"
  network         = "${module.vpc.network}"
  ci_machine_type = "${var.ci_machine_type}"
  ci_disk_image   = "${var.ci_disk_image}"
  ci_disk_type    = "${var.ci_disk_type}"
  ci_disk_size    = "${var.ci_disk_size}"
}

module "monitor" {
  source               = "modules/monitor"
  zone                 = "${var.zone}"
  network              = "${module.vpc.network}"
  monitor_machine_type = "${var.monitor_machine_type}"
  monitor_disk_image   = "${var.monitor_disk_image}"
  monitor_disk_type    = "${var.monitor_disk_type}"
  monitor_disk_size    = "${var.monitor_disk_size}"
}
