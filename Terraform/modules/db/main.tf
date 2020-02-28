resource "google_compute_instance" "db" {
  name         = "reddit-db-${var.envir}"
  machine_type = "g1-small"
  zone         = "${var.region}-b"
  tags         = ["reddit-db"]

  boot_disk {
    initialize_params {
      image = "${var.db_disk_image}"
    }
  }

  network_interface {
    network       = "default"
    access_config = {
    }
  }
  metadata {
    sshKeys = "avih:${file("${var.public_key_path}")}"
  }

  connection {
    type        = "ssh"
    agent       = "false"
    timeout     = "5m"
    user        = "avih"
    private_key = "${file("${var.private_key_path}")}"
  }

}

resource "google_compute_firewall" "firewall_mongo" {
  name = "allow-mongo-default-${var.envir}"
  network = "default"
  allow {
    protocol = "tcp"
    ports = ["27017"]
  }
  target_tags = ["reddit-db"]
  source_tags = ["reddit-app"]
}