provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
}

module "app" {
  source = "modules/app"
  app_disk_image = "${var.app_disk_image}"
  project = "${var.project}"
}

module "db" {
  source = "modules/db"
  db_disk_image = "${var.db_disk_image}"
  project = "${var.project}"
}

module "vpc" {
  source = "modules/vpc"
}

