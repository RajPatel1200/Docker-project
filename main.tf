resource "docker_network" "private_network" {
  name = "project_network_penguin"
}

module "database" {
  source = "./modules/database"
  network_name = docker_network.private_network.name
  db_donkey_pass = var.root_db_password
}

module "frontend" {
  source = "./modules/frontend"
  network_name = docker_network.private_network.name
  container_name = "Donkey_frontend"
  host_root_path = abspath(path.root)
}

module "backend" {
  source = "./modules/backend"

  network_name   = docker_network.private_network.name
  host_root_path = abspath(path.root) 
}


