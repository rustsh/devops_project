# Common settings
variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable zone {
  description = "Zone"
  default     = "europe-west1-b"
}

# APP settings
variable app_machine_type {
  description = "Type of machine for devops project app VM"
  default     = "n1-standard-1"
}

variable app_disk_image {
  description = "Disk image for devops project app VM"
  default     = "centos-7"
}

variable app_disk_type {
  description = "Type of disk for devops project app VM"
  default     = "pd-standard"
}

variable app_disk_size {
  description = "Size of disk for devops project app VM"
  default     = "20"
}

# CI settings
variable ci_machine_type {
  description = "Type of machine for devops project CI VM"
  default     = "n1-standard-1"
}

variable ci_disk_image {
  description = "Disk image for devops project CI VM"
  default     = "centos-7"
}

variable ci_disk_type {
  description = "Type of disk for devops project CI VM"
  default     = "pd-standard"
}

variable ci_disk_size {
  description = "Size of disk for devops project CI VM"
  default     = "100"
}

# Monitor settings
variable monitor_machine_type {
  description = "Type of machine for devops project monitor VM"
  default     = "n1-standard-1"
}

variable monitor_disk_image {
  description = "Disk image for devops project monitor VM"
  default     = "centos-7"
}

variable monitor_disk_type {
  description = "Type of disk for devops project monitor VM"
  default     = "pd-standard"
}

variable monitor_disk_size {
  description = "Size of disk for devops project monitor VM"
  default     = "100"
}
