output "container_id" {
  description = "ID of the frontend container"
  value       = docker_container.frontend.id
}

output "external_port" {
  description = "The port exposed to the host"
  value       = docker_container.frontend.ports[0].external
}