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

output "docker_with_count_container_id_list" {
  value = module.docker_with_count.container_id_list
}

output "docker_with_for_each_container_id_map" {
  value = module.docker_with_for_each.container_id_map
}
