variable "network_name" {
  description = "Name of the docker network to attach to"
  type        = string
}

variable "container_name" {
  description = "Name of the frontend container"
  type        = string
  default     = "Frontend_app"
}

variable "host_root_path" {
  description = "Path on the host machine where the code lives"
  type        = string
}