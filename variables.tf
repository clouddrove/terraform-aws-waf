#Module      : LABEL
#Description : Terraform label module variables.
variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "repository" {
  type        = string
  default     = "https://github.com/clouddrove/terraform-aws-waf"
  description = "Terraform current module repo"
}


variable "label_order" {
  type        = list(any)
  default     = []
  description = "Label order, e.g. `name`,`application`."
}

variable "managedby" {
  type        = string
  default     = "CloudDrove"
  description = "ManagedBy, eg 'CloudDrove'"
}

variable "attributes" {
  type        = list(any)
  default     = []
  description = "Additional attributes (e.g. `1`)."
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)."
}


variable "waf_enabled" {
  type        = bool
  default     = false
  description = "Flag to control the waf creation for load balancer."
}

variable "resource_arn" {
  type        = string
  default     = ""
  description = "ARN of the ALB or cloudfront to be associated with the WAFv2 ACL."
}

variable "resource_arn_list" {
  type        = list(string)
  default     = []
  description = "ARN  List of the ALB or cloudfront to be associated with the WAFv2 ACL."
}

variable "web_acl_association" {
  type        = bool
  default     = true
  description = "If we associated with any resources to WAF"
}


#Module      : WAF
#Description : Terraform WAF module variables.


#logs
variable "firehose_buffer_size" {
  type        = number
  default     = 128
  description = "Buffer incoming data to the specified size, in MBs, before delivering it to the destination. Valid value is between 64-128. Recommended is 128, specifying a smaller buffer size can result in the delivery of very small S3 objects, which are less efficient to query."

}

variable "firehose_buffer_interval" {
  type        = number
  default     = 900
  description = "Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination. Valid value is between 60-900. Smaller value makes the logs delivered faster. Bigger value increase the chance to make the file size bigger, which are more efficient to query."
}
variable "waf_scop" {
  type    = string
  default = "REGIONAL"
}
variable "ip_addresses" {
  type        = list(string)
  default     = null
  description = "(Required) Contains an array of strings that specify one or more IP addresses or blocks of IP addresses in Classless Inter-Domain Routing (CIDR) notation. AWS WAF supports all address ranges for IP versions IPv4 and IPv6."
}

variable "block_sensitive_paths" {
  type    = bool
  default = null
}

variable "rules" {
  description = "List of WAF rules."
  type        = any
  default     = []
}

variable "visibility_config" {
  description = "Visibility config for WAFv2 web acl. https://www.terraform.io/docs/providers/aws/r/wafv2_web_acl.html#visibility-configuration"
  type        = map(string)
  default     = {}
}

variable "allow_default_action" {
  type        = bool
  default     = true
  description = "Set to `true` for WAF to allow requests by default. Set to `false` for WAF to block requests by default."

}

#logs
variable "create_logging_configuration" {
  type        = bool
  default     = true
  description = "Whether to create logging configuration in order start logging from a WAFv2 Web ACL to Amazon Kinesis Data Firehose."
}

variable "redacted_fields" {
  type        = any
  default     = []
  description = "The parts of the request that you want to keep out of the logs. Up to 100 `redacted_fields` blocks are supported."
}

variable "logging_filter" {
  type        = any
  default     = {}
  description = "A configuration block that specifies which web requests are kept in the logs and which are dropped. You can filter on the rule action and on the web request labels that were applied by matching rules during web ACL evaluation."
}
