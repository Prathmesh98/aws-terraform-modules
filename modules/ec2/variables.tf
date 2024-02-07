variable "create_ec2_instance" {
  description = "Whether to create EC2 Instance"
  default = true
}

variable "env" {
  description = "Environment of the EC2 Instance"
  default     = "dev"
}

variable "instance_name" {
  description = "Base name for the EC2 instances"
  type        = string
  default     = "test-instance"
}

variable "create_multiple_instances" {
  description = "Whether to create multiple EC2 instances"
  type        = bool
  default     = false
}

variable "multiple_instance_names" {
  description = "Set of instance names when creating multiple instances, only if create_multiple_instances is set to true"
  type        = list(string)
  default     = ["one", "two", "three"]
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the EC2 key pair"
  type        = string
  default     = "test"
}

variable "create_spot_instance" {
  description = "Whether to create EC2 spot instances"
  type        = bool
  default     = false
}

variable "spot_price" {
  description = "Maximum price you are willing to pay for a spot instance"
  type        = string
  default     = "0.60"
}

variable "spot_type" {
  description = "Spot instance request type"
  type        = string
  default     = "persistent"
}

variable "monitoring" {
  description = "Enable detailed monitoring (CloudWatch)"
  type        = bool
  default     = true
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs to associate with the EC2 instances"
  type        = list(string)
  default     = ["sg-0b2fcb03af3ada4b6"]
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instances"
  type        = string
  default     = "subnet-0b4498e60a566a6d8"
}

variable "ami" {
  description = "ID of the AMI to use for the EC2 instances"
  type        = string
  default     = "ami-0bd145fb0f2dd3da5"
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with the EC2 instances"
  type        = bool
  default     = true
}

variable "availability_zone" {
  description = "Availability zone for the EC2 instances"
  type        = string
  default     = ""
}

variable "create_iam_instance_profile" {
  description = "Whether to create an IAM instance profile for the EC2 instances"
  type        = bool
  default     = false
}

variable "iam_role_name" {
  description = "Name of the IAM role to attach to the EC2 instances"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Additional tags for the EC2 instances"
  type        = map(string)
  default = {
    Managedby   = "Terraform"
    Environment = "dev"
  }
}