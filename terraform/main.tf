terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

module "docker_with_count" {
  source = "./modules/docker_with_count"
}

module "docker_with_for_each" {
  source = "./modules/docker_with_for_each"
}
