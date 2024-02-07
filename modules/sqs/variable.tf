variable "name" {
  description = "Name of the SQS queue"
  default     = "test-sqs"
}

variable "env" {
  description = "Environment of the SQS queue"
  default     = "dev"
}

variable "visibility_timeout_seconds" {
  description = "The visibility timeout for the queue, in seconds"
  default     = 30
}

variable "message_retention_seconds" {
  description = "The number of seconds Amazon SQS retains a message"
  default     = 345600
}

variable "delay_seconds" {
  description = "The time in seconds that the delivery of all messages in the queue is delayed"
  default     = 0
}

variable "max_message_size" {
  description = "The limit of how many bytes a message can contain before Amazon SQS rejects it"
  default     = 262144
}

variable "receive_wait_time_seconds" {
  description = "The time for which a ReceiveMessage call will wait for a message to arrive"
  default     = 0
}

variable "dead_letter_queue_required" {
  description = "Whether a dead-letter queue is required"
  default     = false
}

variable "dead_letter_target_arn" {
  description = "The ARN of the dead-letter queue to which Amazon SQS moves messages after the value of maxReceiveCount is exceeded"
  default     = ""
}

variable "max_receive_count" {
  description = "The number of times a message is delivered to the source queue before being moved to the dead-letter queue"
  default     = 120000
}

variable "fifo_queue" {
  description = "Whether the SQS queue is FIFO (First-In-First-Out)"
  default     = false
}

variable "create_sqs" {
  description = "Whether to create the SQS queue"
  default     = true
}

variable "tags" {
  description = "Tags for the SQS queue"
  type        = map(string)
  default = {
    Environment = "dev"
    Managedby   = "Terraform"
  }
}
