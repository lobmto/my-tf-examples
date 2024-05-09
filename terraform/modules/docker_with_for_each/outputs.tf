output "container_id_map" {
  value = {
    for c in docker_container.nginx : c.name => c.id
  }
}
