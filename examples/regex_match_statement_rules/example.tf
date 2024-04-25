provider "aws" {
  region = "eu-west-1"
}

module "waf" {
  source               = "../../"
  name                 = "waf"
  environment          = "test"
  allow_default_action = false
  waf_enabled          = true
  waf_scop             = "REGIONAL"

  web_acl_association = false
  resource_arn_list   = ["arn:aws:elasticloadbalancing:eu-west-1:xxxxxxx:loadbalancer/app/alb-test/xxxxxxxxx"]

  visibility_config = {
    cloudwatch_metrics_enabled = true
    sampled_requests_enabled   = true
  }

  rules = [
    {
      name     = "rule-100"
      priority = "100"
      action   = "block"

      regex_match_statement = {
        regex_string = "^/admin"

        text_transformation = [
          {
            priority = 90
            type     = "COMPRESS_WHITE_SPACE"
          }
        ]

        field_to_match = {
          uri_path = {}
        }
      }
      visibility_config = {
        cloudwatch_metrics_enabled = false
        metric_name                = "rule-100"
        sampled_requests_enabled   = false
      }
  }, ]

  #logs

  create_logging_configuration = false
  redacted_fields = [
    {
      single_header = {
        name = "user-agent"
      }
    }
  ]

  logging_filter = {
    default_behavior = "DROP"

    filter = [
      {
        behavior    = "KEEP"
        requirement = "MEETS_ANY"
        condition = [
          {
            action_condition = {
              action = "ALLOW"
            }
          },
        ]
      },
      {
        behavior    = "DROP"
        requirement = "MEETS_ALL"
        condition = [
          {
            action_condition = {
              action = "COUNT"
            }
          }

        ]
      }
    ]
  }
}
