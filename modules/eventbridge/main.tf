module "eventbridge" {
  # https://registry.terraform.io/modules/terraform-aws-modules/eventbridge/aws/3.2.2
  source  = "terraform-aws-modules/eventbridge/aws"
  version = "3.2.2"

  create   = var.create
  bus_name = var.bus_name
  rules    = var.rules
  targets  = var.targets
  tags     = var.tags
}
