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
      name     = "rule-50"
      priority = "50"
      action   = "block"


      size_constraint_statement = {
        comparison_operator = "GT"
        size                = 15

        field_to_match = {
          all_query_arguments = {}
        }
        type     = "COMPRESS_WHITE_SPACE"
        priority = 1
      }



      visibility_config = {
        cloudwatch_metrics_enabled = false
        metric_name                = "rule-40"
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
