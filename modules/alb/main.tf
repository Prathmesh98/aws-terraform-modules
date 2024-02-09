module "alb" {
  source              = "terraform-aws-modules/alb/aws"
  version             = "9.4.0"
  create              = var.create
  name                = var.name
  vpc_id              = var.vpc_id
  subnets             = var.subnets
  internal            = var.internal
  load_balancer_type  = var.load_balancer_type
  access_logs         = var.access_logs
  listeners           = var.listeners
  target_groups       = var.target_groups
  tags                = var.tags
  security_group_ingress_rules = var.security_group_ingress_rules
  security_group_egress_rules  = var.security_group_egress_rules
}
