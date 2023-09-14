output "arn" {
  value       = module.waf.arn
  description = "The Amazon Resource Name (ARN) specifying the role."
}

output "tags" {
  value       = module.waf.tags
  description = "A mapping of tags to assign to the resource."
}

output "id" {
  value       = module.waf.id
  description = "A mapping of tags to assign to the resource."
}
