module "sqs" {
  # https://registry.terraform.io/modules/terraform-aws-modules/sqs/aws/4.1.0
  source  = "terraform-aws-modules/sqs/aws"
  version = "4.1.0"

  create                     = var.create_sqs
  name                       = "${var.name}-${var.env}"
  visibility_timeout_seconds = var.visibility_timeout_seconds
  message_retention_seconds  = var.message_retention_seconds
  delay_seconds              = var.delay_seconds
  max_message_size           = var.max_message_size
  receive_wait_time_seconds  = var.receive_wait_time_seconds
  sqs_managed_sse_enabled    = true

  fifo_queue = var.fifo_queue

  tags = {
    Managedby = "Terraform"
  }
}