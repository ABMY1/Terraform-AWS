variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "db_username" {
  description = "Database admin username"
}

variable "db_password" {
  description = "Database admin password"
  sensitive   = true
}

variable "db_name" {
  description = "Database name"
}

variable "db_instance_class" {
  description = "The instance type of the RDS instance"
  default     = "db.t3.micro"
}

variable "rds_security_group_id" {
  description = "The security group ID for RDS"
}
