output "db_instance_identifier" {
  description = "The identifier of the RDS instance"
  value       = module.rds_instance.db_instance_identifier
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = module.rds_instance.db_instance_arn
}

output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = module.rds_instance.db_instance_address
}

output "db_instance_port" {
  description = "The port of the RDS instance"
  value       = module.rds_instance.db_instance_port
}

output "db_instance_username" {
  description = "The username of the RDS instance"
  sensitive   = true
  value       = module.rds_instance.db_instance_username
}
