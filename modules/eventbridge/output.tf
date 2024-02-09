output "eventbridge_bus" {
  description = "The EventBridge Bus created and their attributes"
  value       = module.eventbridge.eventbridge_bus
}

output "eventbridge_bus_arn" {
  description = "The EventBridge Bus ARN"
  value       = module.eventbridge.eventbridge_bus_arn
}
