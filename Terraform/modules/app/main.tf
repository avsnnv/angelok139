resource "google_compute_instance" "app" {
  name         = "reddit-app-${var.envir}"
  machine_type = "g1-small"
  zone         = "${var.region}-b"
  tags         = ["reddit-app"]

  boot_disk {
    initialize_params {
      image = "${var.app_disk_image}"
    }
  }

  network_interface {
    network       = "default"
    access_config = {
      nat_ip = "${google_compute_address.appip.address}"
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

  provisioner "file" {
    source      = "../../AutoDeploy.scripts/pumad.service"
    destination = "/tmp/pumad.service"
  }

  provisioner "remote-exec" {
    script = "../../AutoDeploy.scripts/auto_deploy.sh"
  }
}

resource "google_compute_address" "appip" {
  name = "appip-${var.envir}"
}


resource "google_compute_firewall" "firewall_puma80" {
  name    = "allow-puma-80-${var.envir}"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["reddit-app"]
}

