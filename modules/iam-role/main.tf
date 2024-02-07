# IAM Role
resource "aws_iam_role" "iam_role" {
  name               = var.role_name
  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = {
        Service = var.role_service
      }
      Action    = "sts:AssumeRole"
    }]
  })
}

# IAM Policy Attachments
resource "aws_iam_policy_attachment" "policy_attachments" {
  count      = length(var.policy_arns)
  name       = "${var.role_name}-policy-attachment-${count.index}"
  roles      = [aws_iam_role.iam_role.name]
  policy_arn = var.policy_arns[count.index]
}

# Inline Policy
resource "aws_iam_role_policy" "inline_policy" {
  count       = var.inline_policy_required ? 1 : 0
  name        = "${var.role_name}-inline-policy"
  role        = aws_iam_role.iam_role.name
  policy      = var.inline_policy_document
}