output "lambda_function_name" {
  description = "The name of the Lambda Function"
  value       = module.lambda_function.lambda_role_name
}

output "lambda_function_arn" {
  description = "The ARN of the Lambda Function"
  value       = module.lambda_function.lambda_function_arn
}