module "lambda_function" {
  # https://registry.terraform.io/modules/terraform-aws-modules/lambda/aws/7.2.1
  source  = "terraform-aws-modules/lambda/aws"
  version = "7.2.1"

  create                        = var.create
  function_name                 = var.function_name
  description                   = var.description
  handler                       = var.handler
  runtime                       = var.runtime
  create_layer                  = var.create_layer
  create_role                   = var.create_role
  ephemeral_storage_size        = var.ephemeral_storage_size
  memory_size                   = var.memory_size
  logging_application_log_level = var.logging_application_log_level
  logging_log_group             = var.logging_log_group
  vpc_subnet_ids                = var.vpc_subnet_ids
  logging_log_format            = var.logging_log_format
  create_package                = var.create_package
  local_existing_package        = var.local_existing_package
}
