provider "aws" {
  region = "us-east-1"
}

module "waf" {
  source               = "../../"
  name                 = "waf"
  environment          = "test"
  allow_default_action = true
  waf_enabled          = true
  waf_scop             = "REGIONAL"

  web_acl_association = true
  resource_arn_list   = ["arn:aws:elasticloadbalancing:us-east-1:924144197303:loadbalancer/app/test-waf-alb/3283563be7d87786"]

  visibility_config = {
    cloudwatch_metrics_enabled = true
    metric_name                = "geo-blocking-web-acl"
    sampled_requests_enabled   = true
  }

  rules = [
    {
      name     = "block-geo-countries"
      priority = 10
      action   = "block"

      geo_match_statement = {
        country_codes = ["NL", "GB"]
      }

      visibility_config = {
        cloudwatch_metrics_enabled = true
        metric_name                = "block-geo-countries"
        sampled_requests_enabled   = true
      }
    }
  ]

  create_logging_configuration = false
}
