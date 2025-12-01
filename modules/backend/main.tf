terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

resource "docker_image" "python" {
  name         = "python:3.9-slim"
  keep_locally = true
}

resource "docker_container" "backend" {
  image = docker_image.python.image_id
  name  = "Donkey_backend"

 
  command = ["python", "/app/main.py"]

 
  # Maps your local folder (host_path) to /app inside the container
  volumes {
    host_path      = "${var.host_root_path}/backend-app"
    container_path = "/app"
  }

  networks_advanced {
    name = var.network_name
  }
}