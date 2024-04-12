provider "aws" {
  region = "eu-west-1"
}

locals {
  name        = "waf"
  environment = "test"
}

module "ip_set" {
  source       = "../../"
  name         = local.name
  environment  = local.environment
  ip_addresses = ["51.79.69.69/32"]
}


module "waf" {
  source               = "../../"
  name                 = local.name
  environment          = local.environment
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
      name     = "whitelist-ip-set"
      priority = "0"
      action   = "block"

      ip_set_reference_statement = {
        arn = module.ip_set.ip_set_arn
      }

      visibility_config = {
        cloudwatch_metrics_enabled = true
        metric_name                = "test-waf-setup-waf-ip-set-block-metrics"
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
