## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allow\_default\_action | Set to `true` for WAF to allow requests by default. Set to `false` for WAF to block requests by default. | `bool` | `true` | no |
| cloudwatch\_logs\_policy\_document | (Optional) Custome IAM Policy for CloudWatch Logs log group | `string` | `""` | no |
| cloudwatch\_logs\_retention\_in\_days | Retention period of CloudWatch Logs log group | `number` | `7` | no |
| create\_logging\_configuration | Whether to create logging configuration in order start logging from a WAFv2 Web ACL to Amazon Kinesis Data Firehose. | `bool` | `false` | no |
| description | Description for web acl | `string` | `"WAFv2 ACL"` | no |
| enable | Flag to control the vpc creation. | `bool` | `true` | no |
| enable\_cloudwatch\_logs | Enable WAF logging destination as CloudWatch Logs log group | `bool` | `false` | no |
| enable\_key\_rotation | Specifies whether key rotation is enabled. Defaults to true(security best practice) | `bool` | `true` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| firehose\_buffer\_interval | Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination. Valid value is between 60-900. Smaller value makes the logs delivered faster. Bigger value increase the chance to make the file size bigger, which are more efficient to query. | `number` | `900` | no |
| firehose\_buffer\_size | Buffer incoming data to the specified size, in MBs, before delivering it to the destination. Valid value is between 64-128. Recommended is 128, specifying a smaller buffer size can result in the delivery of very small S3 objects, which are less efficient to query. | `number` | `128` | no |
| ip\_addresses | (Required) Contains an array of strings that specify one or more IP addresses or blocks of IP addresses in Classless Inter-Domain Routing (CIDR) notation. AWS WAF supports all address ranges for IP versions IPv4 and IPv6. | `list(string)` | `null` | no |
| kms\_key\_arn | (Optional) KMS key ARN to encrypt CloudWatch Logs log group | `string` | `null` | no |
| kms\_key\_deletion\_window | KMS Key deletion window in days. | `number` | `10` | no |
| label\_order | Label order, e.g. `name`,`application`. | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| logging\_filter | A configuration block that specifies which web requests are kept in the logs and which are dropped. You can filter on the rule action and on the web request labels that were applied by matching rules during web ACL evaluation. | `any` | `{}` | no |
| managedby | ManagedBy, eg 'CloudDrove' | `string` | `"CloudDrove"` | no |
| mfa | Optional, Required if versioning\_configuration mfa\_delete is enabled) Concatenation of the authentication device's serial number, a space, and the value that is displayed on your authentication device. | `string` | `null` | no |
| mfa\_delete | Specifies whether MFA delete is enabled in the bucket versioning configuration. Valid values: Enabled or Disabled. | `string` | `"Disabled"` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| only\_https\_traffic | This veriables use for only https traffic. | `bool` | `true` | no |
| redacted\_fields | The parts of the request that you want to keep out of the logs. Up to 100 `redacted_fields` blocks are supported. | `any` | `[]` | no |
| repository | Terraform current module repo | `string` | `"https://github.com/clouddrove/terraform-aws-waf"` | no |
| resource\_arn | ARN of the ALB or cloudfront to be associated with the WAFv2 ACL. | `string` | `""` | no |
| resource\_arn\_list | ARN  List of the ALB or cloudfront to be associated with the WAFv2 ACL. | `list(string)` | `[]` | no |
| rules | List of WAF rules. | `any` | `[]` | no |
| s3\_sse\_algorithm | Server-side encryption algorithm to use. Valid values are AES256 and aws:kms | `string` | `"aws:kms"` | no |
| versioning\_status | Required if versioning\_configuration mfa\_delete is enabled) Concatenation of the authentication device's serial number, a space, and the value that is displayed on your authentication device. | `string` | `"Enabled"` | no |
| visibility\_config | Visibility config for WAFv2 web acl. https://www.terraform.io/docs/providers/aws/r/wafv2_web_acl.html#visibility-configuration | `map(string)` | `{}` | no |
| waf\_enabled | Flag to control the waf creation for load balancer. | `bool` | `false` | no |
| waf\_scop | n/a | `string` | `"REGIONAL"` | no |
| web\_acl\_association | If we associated with any resources to WAF | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The Amazon Resource Name (ARN) specifying the role. |
| id | Name of specifying the role. |
| ip\_set\_arn | The ARN of Ip\_set |
| tags | A mapping of tags to assign to the resource. |

