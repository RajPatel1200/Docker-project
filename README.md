Docker Project
Overview

This project shows a small scale implementation of Cloud Infrastructure-as-Code (IaC) setup using Terraform and Docker. It provisions architecture—frontend, backend, and database—running on a custom private Docker network.

Architecture

Platform: Docker Desktop (WSL2 Fedora backend)

Frontend: Nginx container serving custom HTML/CSS 

Backend: Python microservice (SimpleHTTPServer)

Database: PostgreSQL container

Network: Custom Docker network my_project_network isolating all containers

Following enhancements have been implemented
Dynamic Volume Mapping (Code Injection)

Terraform dynamically mounts local source-code folders directly into the running containers:

The frontend-app folder is mapped into the Nginx container

The backend-app folder is mapped into the Python container

Prerequisites

Docker Desktop (with WSL2 integration)

Terraform installed on WSL (Fedora/Ubuntu)

Follow below mentioned steps to run the pjoct

Build the Infrastructure
cd "Docker project"
terraform init
terraform apply --auto-approve

Verify the Application
Frontend

Open the browser:
http://localhost:8080

Backend Connection Test

Run the following command to check if the frontend container can communicate with the backend over the private Docker network:

docker exec Donkey_frontend curl http://Donkey_backend:5000

Note:
use following command to remove all volumes, containers and custom network

terraform destroy --auto-approve
