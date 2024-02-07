variable "env" {
  description = "Environment of the RDS Instance"
  default     = "dev"
}

variable "create_rds_instance" {
  description = "Whether to create RDS Instance"
  default = true
}

variable "identifier" {
  description = "Identifier for the RDS instance"
  default     = "test-db"
}

variable "engine" {
  description = "Database engine (e.g., mysql)"
  default     = "mysql"
}

variable "engine_version" {
  description = "Database engine version (e.g., 5.7)"
  default     = "5.7"
}

variable "instance_class" {
  description = "Database instance class"
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Allocated storage in GB"
  default     = 100
}

variable "multi_az" {
  description = "Enable Multi-AZ deployment"
  default     = true
}

variable "storage_type" {
  description = "Storage type (e.g., gp3)"
  default     = "gp3"
}

variable "publicly_accessible" {
  description = "Whether the database should be publicly accessible"
  default     = false
}

variable "storage_encrypted" {
  description = "Whether storage encryption is enabled"
  default     = true
}

variable "manage_master_user_password" {
  description = "Whether to manage the master user password, it will store password in secrets manager"
  default     = true
}

variable "skip_final_snapshot" {
  description = "Whether to skip the final snapshot"
  default     = true
}

variable "db_name" {
  description = "Name of the database"
  default     = "test-database"
}

variable "username" {
  description = "Username for database access"
  default     = "admin"
}

variable "port" {
  description = "Database port"
  default     = "3306"
}

variable "iam_database_authentication_enabled" {
  description = "Whether IAM database authentication is enabled"
  default     = true
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
  default     = ["sg-0b2fcb03af3ada4b6"]
}

variable "maintenance_window" {
  description = "Maintenance window for the database"
  default     = "Mon:00:00-Mon:03:00"
}

variable "backup_window" {
  description = "Backup window for the database"
  default     = "03:00-06:00"
}

variable "monitoring_interval" {
  description = "Interval for monitoring"
  default     = "30"
}

variable "monitoring_role_name" {
  description = "Name of the monitoring role"
  default     = "MyRDSMonitoringRole"
}

variable "create_monitoring_role" {
  description = "Whether to create a monitoring role"
  default     = true
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
  default     = ["subnet-0b4498e60a566a6d8", "subnet-001ea34c1205a2ad9", "subnet-0af2a8026d02ed136"]
}

variable "create_db_subnet_group" {
  description = "Whether to create db subnet group"
  default     = true
}

variable "family" {
  description = "Family for the database parameter group"
  default     = "mysql5.7"
}

variable "major_engine_version" {
  description = "Major engine version for the option group"
  default     = "5.7"
}

variable "deletion_protection" {
  description = "Whether deletion protection is enabled for the database"
  default     = true
}

variable "parameters" {
  description = "List of database parameters"
  type        = list(map(string))
  default = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ]
}

variable "additional_tags" {
  description = "Additional tags for the RDS instance"
  type        = map(string)
  default = {
    Environment = "dev"
  }
}