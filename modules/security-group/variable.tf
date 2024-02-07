variable "create_sg" {
  description = "Whether to create Security Group or not"
  default     = true
}
variable "name" {
  description = "The name of the security group"
  type        = string
  default     = "test-sg"
}

variable "description" {
  description = "The description of the security group"
  type        = string
  default     = "Security Group created by Terraform"
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
  default     = "vpc-0e21ecc30fb305b41"
}

variable "egress_with_cidr_blocks" {
  type = list(map(string))
  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
      description = "Allow all egress"
    }
  ]
}

variable "ingress_with_cidr_blocks" {
  type = list(map(string))
  default = [
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      description = "Allow HTTPS"
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      description = "Allow SSH"
    }
  ]
}