provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
  version = "0.1.3"
}

resource "google_compute_instance" "app" {
  name         = "reddit-app"
  machine_type = "g1-small"
  zone         = "asia-northeast1-a"
  tags         = ["reddit-app"]

  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
    }
  }

  network_interface {
    network       = "default"
    access_config = {}
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

  provisioner "file" {
    source      = "../AutoDeploy.scripts/pumad.service"
    destination = "/tmp/pumad.service"
  }

  provisioner "remote-exec" {
    script = "../AutoDeploy.scripts/auto_deploy.sh"
  }
}

resource "google_compute_firewall" "firewall_puma" {
  name    = "allow-puma-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["reddit-app"]
}
