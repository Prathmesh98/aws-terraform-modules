module "dynamodb_table" {
  # https://registry.terraform.io/modules/terraform-aws-modules/dynamodb-table/aws/4.0.0
  source  = "terraform-aws-modules/dynamodb-table/aws"
  version = "4.0.0"

  name                        = var.table_name
  hash_key                    = var.hash_key
  autoscaling_enabled         = var.autoscaling_enabled
  billing_mode                = var.billing_mode
  create_table                = var.create_dynamodb_table
  stream_enabled              = var.stream_enabled
  ttl_enabled                 = var.ttl_enabled
  attributes                  = var.attributes
  deletion_protection_enabled = var.deletion_protection_enabled
  tags                        = var.tags
}
