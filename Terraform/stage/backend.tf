terraform {
  backend "gcs" {
    bucket = "infra-182709.appspot.com"
    path = "terraform.tfstate"
    project = "infra-182709"
  }
}

