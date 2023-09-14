provider "aws" {
  region = "eu-west-1"
}

locals {
  name        = "waf"
  environment = "test"

}
module "ip_set" {
  source       =  "clouddrove/labels/aws"
  version      = "2.0.0"
  name         = local.name
  environment  = local.environment
  ip_addresses = ["51.79.69.69/32"]
}

module "waf" {
  source               = "clouddrove/labels/aws"
  version              = "2.0.0"
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
    # ip  set statement rules. 30
    {
      name     = "WhitelistIpSetRule0"
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
    },

    # ## Byte match statement rules. 30
    {
      name     = "ByteMatchRule30"
      priority = "30"
      action   = "allow"


      byte_match_statement = {
        positional_constraint = "EXACTLY"
        search_string         = "/cp-key"
        priority              = 30
        type                  = "COMPRESS_WHITE_SPACE"
        field_to_match = {
          uri_path = {}
        }
      }

      visibility_config = {
        cloudwatch_metrics_enabled = false
        metric_name                = "ByteMatchRule30"
        sampled_requests_enabled   = false
      }
    },

    # ## geo_allowlist_statement_rules 90
    {
      name     = "GeoAllowlistRule90"
      priority = "90"
      action   = "count"

      not_statement = {
        geo_match_statement = {
          country_codes = ["US"]
        }
      }

      visibility_config = {
        cloudwatch_metrics_enabled = false
        metric_name                = "GeoAllowlistRule90"
        sampled_requests_enabled   = false
      }
    },

    # ## geo_match_statement_rules 60
    {
      name     = "GeoMatchRule60"
      priority = "60"
      action   = "count"

      geo_match_statement = {
        country_codes = ["NL", "GB"]
      }

      visibility_config = {
        cloudwatch_metrics_enabled = false
        metric_name                = "GeoMatchRule60"
        sampled_requests_enabled   = false
      }
    },

    # # managed_rule_group_statement_rules 1-7
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
      
    # #rate_based_statement_rules 40
    {
      name     = "RateBasedRule40"
      priority = "40"
      action   = "block"


      rate_based_statement = {
        limit              = 100
        aggregate_key_type = "IP"
      }

      visibility_config = {
        cloudwatch_metrics_enabled = false
        metric_name                = "RateBasedRule40"
        sampled_requests_enabled   = false
      }
    },

    # #regex_match_statement_rules 100
    {
      name     = "RegexMatchRule100"
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
        metric_name                = "RegexMatchRule100"
        sampled_requests_enabled   = false
      }
    },

    # #size_constraint_statement_rules 50
    {
      name     = "SizeConstraintRule50"
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
        metric_name                = "SizeConstraintRule50"
        sampled_requests_enabled   = false
      }
    },

    # #sqli_match_statement_rules 70
    {
      name     = "SqliMatchRule70"
      priority = "70"
      action   = "block"

      sqli_match_statement = {

        field_to_match = {
          query_string = {}
        }

        text_transformation = [
          {
            type     = "URL_DECODE"
            priority = 1
          },
          {
            type     = "HTML_ENTITY_DECODE"
            priority = 2
          }
        ]

      }

      visibility_config = {
        cloudwatch_metrics_enabled = false
        metric_name                = "SqliMatchRule70"
        sampled_requests_enabled   = false
      }
    },

    # #xss_match_statement 80
    {
      name     = "XsssMatchRule80"
      priority = "80"
      action   = "block"


      xss_match_statement = {
        field_to_match = {
          uri_path = {}
        }

        text_transformation = [
          {
            type     = "URL_DECODE"
            priority = 1
          },
          {
            type     = "HTML_ENTITY_DECODE"
            priority = 2
          }
        ]
      }

      visibility_config = {
        cloudwatch_metrics_enabled = false
        metric_name                = "XsssMatchRule80"
        sampled_requests_enabled   = false
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
