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
  name         = var.image_name
  keep_locally = false
}

resource "docker_container" "nginx" {
  count = 2

  image = "nginx:latest"
  name  = "count_${count.index}"
  ports {
    internal = 80
    external = var.external_port[count.index]
  }
}
