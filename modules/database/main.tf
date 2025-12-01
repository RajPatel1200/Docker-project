terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

resource "docker_image" "postgres" {
  name         = "postgres:15-alpine"
  keep_locally = true
}

resource "docker_container" "db" {
  image = docker_image.postgres.image_id
  name  = var.container_name
  
  # Inject the password as an environment variable
  env = [
    "POSTGRES_PASSWORD=${var.db_donkey_pass}"
  ]

  networks_advanced {
    name = var.network_name
  }
}