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

  web_acl_association = true
  resource_arn_list   = ["arn:aws:elasticloadbalancing:eu-west-1:123456789012:loadbalancer/app/example-alb/1234567890abcdef"]

  visibility_config = {
    cloudwatch_metrics_enabled = true
    sampled_requests_enabled   = true
  }

  rules = [
    {
      name     = "allow-geo-us"
      priority = "80"
      action   = "allow"

      geo_match_statement = {
        country_codes = ["US"]
      }
      visibility_config = {
        cloudwatch_metrics_enabled = true
        metric_name                = "allow-geo-us"
        sampled_requests_enabled   = true
      }
    }
  ]

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
