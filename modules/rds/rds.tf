module "rds_instance" {
  # https://registry.terraform.io/modules/terraform-aws-modules/rds/aws/6.4.0
  source  = "terraform-aws-modules/rds/aws"
  version = "6.4.0"

  create_db_instance          = var.create_rds_instance
  identifier                  = "${var.identifier}-${var.env}"
  engine                      = var.engine
  engine_version              = var.engine_version
  family                      = var.family
  major_engine_version        = var.major_engine_version
  instance_class              = var.instance_class
  allocated_storage           = var.allocated_storage
  multi_az                    = var.multi_az
  storage_type                = var.storage_type
  publicly_accessible         = var.publicly_accessible
  storage_encrypted           = var.storage_encrypted
  manage_master_user_password = var.manage_master_user_password
  skip_final_snapshot         = var.skip_final_snapshot
  deletion_protection         = var.deletion_protection

  db_name  = var.db_name
  username = var.username
  port     = var.port

  iam_database_authentication_enabled = var.iam_database_authentication_enabled

  vpc_security_group_ids = var.vpc_security_group_ids

  maintenance_window = var.maintenance_window
  backup_window      = var.backup_window

  monitoring_interval    = var.monitoring_interval
  monitoring_role_name   = var.monitoring_role_name
  create_monitoring_role = var.create_monitoring_role

  tags = merge(var.additional_tags, {
    Managedby   = "Terraform"
  })

  create_db_subnet_group = var.create_db_subnet_group
  subnet_ids             = var.subnet_ids

  parameters = var.parameters

}