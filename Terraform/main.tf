provider "google" {
  project = "infra-182709"
  region = "asia-northeast1-a"
  version = "0.1.3"
}

resource "google_compute_instance" "app" {
  name		= "reddit-app"
  machine_type 	= "g1-small"
  zone		= "asia-northeast1-a"
  tags = ["reddit-app"]
  boot_disk {
    initialize_params {
      image = "reddit-base-1507899498"
    }
  }
  network_interface {
    network = "default"
    access_config {}
  }
  metadata {
    sshKeys = "avih:${file("~/.ssh/id_rsa.pub")}"
  }

  connection {
    timeout     = "5m"
    user	= "avih"
    private_key = "${file("~/.ssh/id_rsa")}"
  }

  provisioner "file" {
    source = "../AutoDeploy.scripts/pumad.service"
    destination = "/tmp/pumad.service"
  }


  provisioner "remote-exec" {
    script = "../AutoDeploy.scripts/auto_deploy.sh"
  }

}

resource "google_compute_firewall" "firewall_puma"{
  name = "allow-puma-default"
  network = "default"
  allow {
    protocol = "tcp"
    ports = ["9292"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["reddit-app"]
}

