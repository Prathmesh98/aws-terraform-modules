variable "create" {
  description = "Whether to create the Lambda function"
  type        = bool
  default     = true
}

variable "function_name" {
  description = "The name of the Lambda function"
  type        = string
  default     = "test-lambda"
}

variable "description" {
  description = "The description of the Lambda function"
  type        = string
  default     = "My awesome lambda function"
}

variable "handler" {
  description = "The entry point for the Lambda function"
  type        = string
  default     = "index.lambda_handler"
}

variable "runtime" {
  description = "The runtime environment for the Lambda function"
  type        = string
  default     = "python3.8"
}

variable "create_layer" {
  description = "Whether to create a Lambda layer"
  type        = bool
  default     = false
}

variable "create_role" {
  description = "Whether to create an IAM role for the Lambda function, for log group"
  type        = bool
  default     = true
}

variable "ephemeral_storage_size" {
  description = "The size of the /tmp directory in MB available to the function"
  type        = number
  default     = 512
}

variable "memory_size" {
  description = "The amount of memory in MB allocated to the Lambda function"
  type        = number
  default     = 128
}

variable "logging_application_log_level" {
  description = "The log level for application logs"
  type        = string
  default     = "INFO"
}

variable "logging_log_group" {
  description = "The name of the CloudWatch Logs log group to send application logs to"
  type        = string
  default     = "lambda-function/dev/test-lambda"
}

variable "logging_log_format" {
  description = "Format for logging"
  type        = string
  default     = "JSON"
}

variable "vpc_subnet_ids" {
  description = "The list of subnet IDs associated with the Lambda function"
  type        = list(string)
  default     = []
}

variable "create_package" {
  description = "Whether to create a deployment package for the Lambda function"
  type        = bool
  default     = false
}

variable "local_existing_package" {
  description = "The path to the existing deployment package for the Lambda function"
  type        = string
  default     = "./test.zip"
}
