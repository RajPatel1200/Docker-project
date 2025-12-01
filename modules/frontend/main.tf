terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "frontend" {

  image = docker_image.nginx.image_id
  name  = var.container_name

  upload {
    file = "/usr/share/nginx/html/index.html"
    source = "${var.host_root_path}/frontend-app/index.html"
  }

  upload{
     file = "/usr/share/nginx/html/style.css"
    source = "${var.host_root_path}/frontend-app/style.css"
  }
  
  ports {
    internal = 80
    external = 8000
  }

  networks_advanced {
    name = var.network_name
  }
}