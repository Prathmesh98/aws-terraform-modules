module "ec2_instance" {
  # https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/5.6.0
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"

  create                      = var.create_ec2_instance
  for_each                    = var.create_multiple_instances ? toset(var.multiple_instance_names) : toset([""])
  name                        = var.create_multiple_instances ? "${var.instance_name}-${var.env}-${each.key}" : "${var.instance_name}-${var.env}"
  create_spot_instance        = var.create_spot_instance
  spot_price                  = var.spot_price
  spot_type                   = var.spot_type
  instance_type               = var.instance_type
  key_name                    = var.key_name
  monitoring                  = var.monitoring
  vpc_security_group_ids      = var.vpc_security_group_ids
  subnet_id                   = var.subnet_id
  ami                         = var.ami
  associate_public_ip_address = var.associate_public_ip_address
  availability_zone           = var.availability_zone
  create_iam_instance_profile = var.create_iam_instance_profile
  iam_role_name               = var.iam_role_name
  tags                        = var.tags
}