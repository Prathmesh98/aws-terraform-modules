variable "table_name" {
  description = "Name of the DynamoDB table"
  type        = string
  default     = "my-table"
}

variable "hash_key" {
  description = "Name of the table's hash key"
  type        = string
  default     = "id"
}

variable "autoscaling_enabled" {
  description = "Whether to enable autoscaling for the DynamoDB table"
  type        = bool
  default     = false
}

variable "billing_mode" {
  description = "The billing mode for the DynamoDB table"
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "create_dynamodb_table" {
  description = "Whether to create the DynamoDB table"
  type        = bool
  default     = true
}

variable "stream_enabled" {
  description = "Whether to enable DynamoDB Streams for the table"
  type        = bool
  default     = false
}

variable "deletion_protection_enabled" {
  description = "Allow deletion protection"
  default     = false
}

variable "ttl_enabled" {
  description = "Whether to enable Time To Live (TTL) for the table"
  type        = bool
  default     = false
}

variable "attributes" {
  description = "List of attributes for the DynamoDB table"
  type = list(object({
    name = string
    type = string
  }))
  default = [
    {
      name = "id"
      type = "N"
    }
  ]
}

variable "tags" {
  description = "Additional tags for the DynamoDB table"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "staging"
  }
}
