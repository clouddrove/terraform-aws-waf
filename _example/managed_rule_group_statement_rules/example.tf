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
    cloudwatch_metrics_enabled = false
    sampled_requests_enabled   = true
  }

  rules = [
    {
      name            = "AWS-AWSManagedRulesAdminProtectionRuleSet"
      priority        = "1"
      override_action = "none"

      managed_rule_group_statement = {
        name = "AWSManagedRulesAdminProtectionRuleSet"
      }

      visibility_config = {
        cloudwatch_metrics_enabled = true
        metric_name                = "AWSManagedRulesAdminProtectionRuleSet"
        sampled_requests_enabled   = true
      }
    },
    {
      name            = "AWS-AWSManagedRulesAmazonIpReputationList"
      priority        = "2"
      override_action = "none"

      managed_rule_group_statement = {
        name = "AWSManagedRulesAmazonIpReputationList"
      }

      visibility_config = {
        cloudwatch_metrics_enabled = true
        metric_name                = "AWS-AWSManagedRulesAmazonIpReputationList"
        sampled_requests_enabled   = true
      }
    },
    {
      name            = "AWS-AWSManagedRulesCommonRuleSet"
      priority        = 3
      override_action = "none"

      managed_rule_group_statement = {
        name = "AWSManagedRulesCommonRuleSet"
      }

      visibility_config = {
        cloudwatch_metrics_enabled = true
        sampled_requests_enabled   = true
        metric_name                = "AWS-AWSManagedRulesCommonRuleSet"
      }
    },
    {
      name            = "AWS-AWSManagedRulesKnownBadInputsRuleSet"
      priority        = 4
      override_action = "none"

      managed_rule_group_statement = {
        name        = "AWSManagedRulesKnownBadInputsRuleSet"
        vendor_name = "AWS"
      }

      visibility_config = {
        cloudwatch_metrics_enabled = true
        sampled_requests_enabled   = true
        metric_name                = "AWS-AWSManagedRulesKnownBadInputsRuleSet"
      }
    },
    {
      name            = "AWS-AWSManagedRulesSQLiRuleSet",
      priority        = 5
      override_action = "none"
      excluded_rules  = []

      managed_rule_group_statement = {
        name        = "AWSManagedRulesSQLiRuleSet"
        vendor_name = "AWS"
      }

      visibility_config = {
        cloudwatch_metrics_enabled = true
        sampled_requests_enabled   = true
        metric_name                = "AWSManagedRulesSQLiRuleSet"
      }
    },
    {
      name            = "AWS-AWSManagedRulesPHPRuleSet",
      priority        = 6
      override_action = "none"
      excluded_rules  = []

      managed_rule_group_statement = {
        name        = "AWSManagedRulesPHPRuleSet"
        vendor_name = "AWS"
      }

      visibility_config = {
        cloudwatch_metrics_enabled = true
        sampled_requests_enabled   = true
        metric_name                = "AWSManagedRulesPHPRuleSet"
      }
    },
    {
      name            = "AWS-AWSManagedRulesAnonymousIpList",
      priority        = 7
      override_action = "none"
      excluded_rules  = []

      managed_rule_group_statement = {
        name        = "AWSManagedRulesAnonymousIpList"
        vendor_name = "AWS"
      }

      visibility_config = {
        cloudwatch_metrics_enabled = true
        sampled_requests_enabled   = true
        metric_name                = "AWSManagedRulesAnonymousIpList"
      }
    },

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
