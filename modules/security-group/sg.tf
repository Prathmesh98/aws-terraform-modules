module "security_group" {
  # https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/5.1.0
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  create      = var.create_sg
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  egress_with_cidr_blocks  = var.egress_with_cidr_blocks
  ingress_with_cidr_blocks = var.ingress_with_cidr_blocks
}