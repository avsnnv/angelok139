variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable public_key_path {
  description = "Path to ssh pub key"
  default     = "~/.ssh/id_rsa.pub"
}

variable private_key_path {
  description = "Path to ssh priv key"
  default     = "~/.ssh/id_rsa"
}

variable app_disk_image {
  description = "Application disk image"
  default = "reddit-app-1508008884"
}

variable envir {
  description = "Enviropment"
  default = "stage"
}
