output "container_id_list" {
  value = [for c in docker_container.nginx : c.id]
}
