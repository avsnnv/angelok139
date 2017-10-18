resource "google_compute_firewall" "firewall_ssh" {
  name  = "default-allow-ssh-${var.envir}"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["${var.source_range}"]
}

