variable "root_db_password" {
  description = "Password passed from tfvars to the db module"
  type        = string
  sensitive   = true
}