variable "create" {
  description = "Boolean flag to create the ALB"
  type        = bool
  default     = true
}

variable "name" {
  description = "The name of the ALB"
  type        = string
  default     = "my-alb"
}

variable "vpc_id" {
  description = "The ID of the VPC where the ALB will be deployed"
  type        = string
  default     = "vpc-0e21ecc30fb305b41"
}

variable "subnets" {
  description = "A list of subnet IDs to associate with the ALB"
  type        = list(string)
  default     = ["subnet-0b4498e60a566a6d8", "subnet-001ea34c1205a2ad9", "subnet-0af2a8026d02ed136"]
}

variable "internal" {
  description = "Boolean flag to indicate if the ALB should be internal or external"
  type        = bool
  default     = false
}

variable "load_balancer_type" {
  description = "The type of load balancer to create (application or network)"
  type        = string
  default     = "application"
}

variable "access_logs" {
  description = "Access logs configuration for the ALB"
  type        = map(string)
  default     = {
    bucket = "my-alb-logs"
  }
}

variable "listeners" {
  description = "Listener configuration for the ALB"
  type        = map(object({
    port        = number
    protocol    = string
    redirect    = optional(object({
      port        = string
      protocol    = string
      status_code = string
    }))
    certificate_arn = optional(string)
    forward         = optional(object({
      target_group_key = string
    }))
  }))
  default     = {
    ex-http-https-redirect = {
      port     = 80
      protocol = "HTTP"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }
    ex-https = {
      port            = 443
      protocol        = "HTTPS"
      certificate_arn = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
      forward         = {
        target_group_key = "ex-instance"
      }
    }
  }
}

variable "target_groups" {
  description = "Target groups configuration for the ALB"
  type        = map(object({
    name_prefix = string
    protocol    = string
    port        = number
    target_type = string
    target_id   = string
  }))
  default     = {
    ex-instance = {
      name_prefix = "h1"
      protocol    = "HTTP"
      port        = 80
      target_type = "instance"
      target_id   = ""
    }
  }
}

variable "tags" {
  description = "Tags to be applied to the ALB resources"
  type        = map(string)
  default     = {
    Environment = "Development"
    Project     = "Example"
  }
}

variable "security_group_ingress_rules" {
  description = "A map of ingress security group rules for the ALB"
  type        = map(object({
    from_port   = number
    to_port     = number
    ip_protocol = string
    description = string
    cidr_ipv4   = string
  }))
  default     = {
    all_http = {
      from_port   = 80
      to_port     = 80
      ip_protocol = "tcp"
      description = "HTTP web traffic"
      cidr_ipv4   = "0.0.0.0/0"
    }
    all_https = {
      from_port   = 443
      to_port     = 443
      ip_protocol = "tcp"
      description = "HTTPS web traffic"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }
}

variable "security_group_egress_rules" {
  description = "A map of egress security group rules for the ALB"
  type        = map(object({
    ip_protocol = string
    cidr_ipv4   = string
  }))
  default     = {
    all = {
      ip_protocol = "-1"
      cidr_ipv4   = "10.0.0.0/16"
    }
  }
}
