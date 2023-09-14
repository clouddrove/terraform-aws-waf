# Module      : Iam Role
# Description : Terraform module to create Iam Role resource on AWS.
output "arn" {
  value       = join("", aws_wafv2_ip_set.main[*].arn)
  description = "The Amazon Resource Name (ARN) specifying the role."
}

output "tags" {
  value       = module.labels.tags
  description = "A mapping of tags to assign to the resource."
}

output "id" {
  value       = join("", aws_wafv2_ip_set.main[*].name)
  description = "Name of specifying the role."
}

output "ip_set_arn" {
  value       = join("", aws_wafv2_ip_set.main[*].arn)
  description = "The ARN of Ip_set"
}