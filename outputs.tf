output "app_url" {
  description = "Click this link to access the app"
  value       = "http://localhost:${module.frontend.external_port}"
}

output "db_status" {
  description = "Database container name"
  value       = module.database.container_name
}