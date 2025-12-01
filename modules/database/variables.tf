variable "db_donkey_pass" {
  description = "Password for the Postgres database"
  type        = string
  sensitive   = true # Hides it from logs
}

variable "network_name" {
  description = "Name of the docker network to attach"
  type        = string
}

variable "container_name" {
  description = "Name of the database container"
  type        = string
  default     = "Donkey_db"
}