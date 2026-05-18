<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.10.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.80.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.80.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_labels"></a> [labels](#module\_labels) | clouddrove/labels/aws | 1.3.1 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.cloudwatch_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_group.firehose_error_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_resource_policy.cloudwatch_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_resource_policy) | resource |
| [aws_cloudwatch_log_stream.firehose_error_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_stream) | resource |
| [aws_glue_catalog_database.database](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_catalog_database) | resource |
| [aws_glue_catalog_table.table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_catalog_table) | resource |
| [aws_iam_role.firehose](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.allow_glue_get_table_versions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.allow_put_log_events](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_kinesis_firehose_delivery_stream.waf](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) | resource |
| [aws_kms_alias.kms-alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.kms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_kms_key_policy.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key_policy) | resource |
| [aws_s3_bucket.webacl_traffic_information](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.webacl_traffic_information](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_ownership_controls.webacl_traffic_information](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_policy.block-http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_policy.webacl_traffic_information_lb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.webacl_traffic_information](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.webacl_traffic_information](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_wafv2_ip_set.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_ip_set) | resource |
| [aws_wafv2_web_acl.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl) | resource |
| [aws_wafv2_web_acl_association.alb_list](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl_association) | resource |
| [aws_wafv2_web_acl_association.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl_association) | resource |
| [aws_wafv2_web_acl_logging_configuration.cloudwatch_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl_logging_configuration) | resource |
| [aws_wafv2_web_acl_logging_configuration.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl_logging_configuration) | resource |
| [aws_caller_identity.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.allow_glue_get_table_versions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.allow_put_log_events](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.allow_s3_actions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.cloudwatch_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.firehose_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_default_action"></a> [allow\_default\_action](#input\_allow\_default\_action) | Set to `true` for WAF to allow requests by default. Set to `false` for WAF to block requests by default. | `bool` | `true` | no |
| <a name="input_bucket_key_enabled"></a> [bucket\_key\_enabled](#input\_bucket\_key\_enabled) | Whether to enable S3 bucket key for SSE-KMS encryption | `bool` | `false` | no |
| <a name="input_cloudwatch_logs_policy_document"></a> [cloudwatch\_logs\_policy\_document](#input\_cloudwatch\_logs\_policy\_document) | (Optional) Custome IAM Policy for CloudWatch Logs log group | `string` | `""` | no |
| <a name="input_cloudwatch_logs_retention_in_days"></a> [cloudwatch\_logs\_retention\_in\_days](#input\_cloudwatch\_logs\_retention\_in\_days) | Retention period of CloudWatch Logs log group | `number` | `7` | no |
| <a name="input_create_logging_configuration"></a> [create\_logging\_configuration](#input\_create\_logging\_configuration) | Whether to create logging configuration in order start logging from a WAFv2 Web ACL to Amazon Kinesis Data Firehose. | `bool` | `false` | no |
| <a name="input_deletion_protection_enabled"></a> [deletion\_protection\_enabled](#input\_deletion\_protection\_enabled) | Whether to enable deletion protection for CloudWatch Log Groups | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | Description for web acl | `string` | `"WAFv2 ACL"` | no |
| <a name="input_enable"></a> [enable](#input\_enable) | Flag to control the vpc creation. | `bool` | `true` | no |
| <a name="input_enable_cloudwatch_logs"></a> [enable\_cloudwatch\_logs](#input\_enable\_cloudwatch\_logs) | Enable WAF logging destination as CloudWatch Logs log group | `bool` | `false` | no |
| <a name="input_enable_key_rotation"></a> [enable\_key\_rotation](#input\_enable\_key\_rotation) | Specifies whether key rotation is enabled. Defaults to true(security best practice) | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| <a name="input_firehose_buffer_interval"></a> [firehose\_buffer\_interval](#input\_firehose\_buffer\_interval) | Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination. Valid value is between 60-900. Smaller value makes the logs delivered faster. Bigger value increase the chance to make the file size bigger, which are more efficient to query. | `number` | `900` | no |
| <a name="input_firehose_buffer_size"></a> [firehose\_buffer\_size](#input\_firehose\_buffer\_size) | Buffer incoming data to the specified size, in MBs, before delivering it to the destination. Valid value is between 64-128. Recommended is 128, specifying a smaller buffer size can result in the delivery of very small S3 objects, which are less efficient to query. | `number` | `128` | no |
| <a name="input_ip_addresses"></a> [ip\_addresses](#input\_ip\_addresses) | (Required) Contains an array of strings that specify one or more IP addresses or blocks of IP addresses in Classless Inter-Domain Routing (CIDR) notation. AWS WAF supports all address ranges for IP versions IPv4 and IPv6. | `list(string)` | `null` | no |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | (Optional) KMS key ARN to encrypt CloudWatch Logs log group | `string` | `null` | no |
| <a name="input_kms_key_deletion_window"></a> [kms\_key\_deletion\_window](#input\_kms\_key\_deletion\_window) | KMS Key deletion window in days. | `number` | `10` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Label order, e.g. `name`,`application`. | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| <a name="input_logging_filter"></a> [logging\_filter](#input\_logging\_filter) | A configuration block that specifies which web requests are kept in the logs and which are dropped. You can filter on the rule action and on the web request labels that were applied by matching rules during web ACL evaluation. | `any` | `{}` | no |
| <a name="input_managedby"></a> [managedby](#input\_managedby) | ManagedBy, eg 'CloudDrove' or 'AnmolNagpal' | `string` | `"CloudDrove"` | no |
| <a name="input_mfa"></a> [mfa](#input\_mfa) | Optional, Required if versioning\_configuration mfa\_delete is enabled) Concatenation of the authentication device's serial number, a space, and the value that is displayed on your authentication device. | `string` | `null` | no |
| <a name="input_mfa_delete"></a> [mfa\_delete](#input\_mfa\_delete) | Specifies whether MFA delete is enabled in the bucket versioning configuration. Valid values: Enabled or Disabled. | `string` | `"Disabled"` | no |
| <a name="input_multi_region"></a> [multi\_region](#input\_multi\_region) | Whether to create a multi-region KMS key | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| <a name="input_only_https_traffic"></a> [only\_https\_traffic](#input\_only\_https\_traffic) | This veriables use for only https traffic. | `bool` | `true` | no |
| <a name="input_redacted_fields"></a> [redacted\_fields](#input\_redacted\_fields) | The parts of the request that you want to keep out of the logs. Up to 100 `redacted_fields` blocks are supported. | `any` | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region to use for regional resources | `string` | `""` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Terraform current module repo | `string` | `"https://github.com/clouddrove/terraform-aws-waf"` | no |
| <a name="input_resource_arn"></a> [resource\_arn](#input\_resource\_arn) | ARN of the ALB or cloudfront to be associated with the WAFv2 ACL. | `string` | `""` | no |
| <a name="input_resource_arn_list"></a> [resource\_arn\_list](#input\_resource\_arn\_list) | ARN  List of the ALB or cloudfront to be associated with the WAFv2 ACL. | `list(string)` | `[]` | no |
| <a name="input_rules"></a> [rules](#input\_rules) | List of WAF rules. | `any` | `[]` | no |
| <a name="input_s3_sse_algorithm"></a> [s3\_sse\_algorithm](#input\_s3\_sse\_algorithm) | Server-side encryption algorithm to use. Valid values are AES256 and aws:kms | `string` | `"aws:kms"` | no |
| <a name="input_versioning_status"></a> [versioning\_status](#input\_versioning\_status) | Required if versioning\_configuration mfa\_delete is enabled) Concatenation of the authentication device's serial number, a space, and the value that is displayed on your authentication device. | `string` | `"Enabled"` | no |
| <a name="input_visibility_config"></a> [visibility\_config](#input\_visibility\_config) | Visibility config for WAFv2 web acl. https://www.terraform.io/docs/providers/aws/r/wafv2_web_acl.html#visibility-configuration | `map(string)` | `{}` | no |
| <a name="input_waf_enabled"></a> [waf\_enabled](#input\_waf\_enabled) | Flag to control the waf creation for load balancer. | `bool` | `false` | no |
| <a name="input_waf_scop"></a> [waf\_scop](#input\_waf\_scop) | n/a | `string` | `"REGIONAL"` | no |
| <a name="input_web_acl_association"></a> [web\_acl\_association](#input\_web\_acl\_association) | If we associated with any resources to WAF | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The Amazon Resource Name (ARN) specifying the role. |
| <a name="output_id"></a> [id](#output\_id) | Name of specifying the role. |
| <a name="output_ip_set_arn"></a> [ip\_set\_arn](#output\_ip\_set\_arn) | The ARN of Ip\_set |
| <a name="output_tags"></a> [tags](#output\_tags) | A mapping of tags to assign to the resource. |
<!-- END_TF_DOCS -->