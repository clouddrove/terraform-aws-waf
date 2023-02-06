provider "aws" {
  region = "eu-west-1"
}

module "ip_set" {
  source       = "../"
  name         = "waf"
  environment  = "test"
  ip_addresses = ["51.79.69.69/32"]
}



module "waf" {
  source               = "../"
  name                 = "waf"
  environment          = "test"
  allow_default_action = true
  waf_enabled          = true
  waf_scop             = "REGIONAL"

  web_acl_association = true
  resource_arn_list   = ["arn:aws:elasticloadbalancing:eu-west-1:xxxxxxx:loadbalancer/app/alb-test/xxxxxxxxx"]

  visibility_config = {
    cloudwatch_metrics_enabled = true
    sampled_requests_enabled   = true
  }

  rules = [

    {
      name     = "rate-limit"
      priority = "1"
      action   = "block"

      visibility_config = {
        cloudwatch_metrics_enabled = true
        metric_name                = "rate-limit"
        sampled_requests_enabled   = true
      }

      rate_based_statement = {
        limit              = 2000
        aggregate_key_type = "IP"
      }
    },
    {
      name     = "allow-ip-set"
      priority = "0"
      action   = "allow"

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
