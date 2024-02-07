variable "role_name" {
  description = "The name of the IAM role"
  type        = string
  default     = "test-role"
}

variable "policy_arns" {
  description = "A list of ARNs of policies to attach to the IAM role"
  type        = list(string)
  default     = [
    "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
    "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess",
    "arn:aws:iam::aws:policy/AmazonSQSReadOnlyAccess"
  ]
}

variable "role_service" {
  description = "The service principal for which the IAM role will be assumed"
  type        = string
  default     = "ec2.amazonaws.com"
}

variable "inline_policy_required" {
  description = "Indicates whether an inline policy should be attached to the IAM role"
  type        = bool
  default     = false
}

variable "inline_policy_document" {
  description = "The JSON policy document for the inline policy, only work if variable inline_policy_required is true"
  type        = string
  default     = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}