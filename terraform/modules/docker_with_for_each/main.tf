terraform {
  required_providers {
    // HashiCorp外部のProviderのため，継承ではなくモジュール内にも定義を行う
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

resource "docker_image" "nginx" {
  for_each = var.image_names

  name         = each.value
  keep_locally = false
}

resource "docker_container" "nginx" {
  for_each = docker_image.nginx

  image = each.value.image_id
  name  = each.key
}
