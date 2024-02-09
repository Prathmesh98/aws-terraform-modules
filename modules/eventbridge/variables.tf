variable "create" {
  description = "Whether to create the EventBridge resources"
  type        = bool
  default     = true
}

variable "bus_name" {
  description = "The name of the EventBridge bus"
  type        = string
  default     = "test-bus"
}

variable "rules" {
  description = "A map of EventBridge rules"
  type = map(object({
    description   = string
    event_pattern = string
    state         = string
  }))
  default = {
    orders = {
      description   = "Capture all order data"
      event_pattern = "{\"source\":[\"myapp.orders\"]}"
      state         = "ENABLED"
    }
  }
}

variable "targets" {
  description = "A map of EventBridge targets"
  type = map(list(object({
    name              = string
    arn               = string
    dead_letter_arn   = string
    input_transformer = optional(string)
  })))
  default = {
    orders = [
      {
        name              = "send-orders-to-sqs"
        arn               = "arn:aws:sqs:us-west-2:123456789012:my-queue"
        dead_letter_arn   = "arn:aws:sqs:us-west-2:123456789012:my-dlq"
        input_transformer = null
      },
      {
        name              = "send-orders-to-kinesis"
        arn               = "arn:aws:kinesis:us-west-2:123456789012:my-stream"
        dead_letter_arn   = "arn:aws:sqs:us-west-2:123456789012:my-dlq"
        input_transformer = null
      },
      {
        name              = "log-orders-to-cloudwatch"
        arn               = "arn:aws:logs:us-west-2:123456789012:log-group:my-log-group"
        dead_letter_arn   = "arn:aws:sqs:us-west-2:123456789012:my-dlq"
        input_transformer = null
      }
    ]
  }
}

variable "tags" {
  description = "A map of tags to apply to all resources"
  type        = map(string)
  default = {
    Name = "my-bus"
  }
}
