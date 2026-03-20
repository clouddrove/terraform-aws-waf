provider "aws" {
  region = "us-east-1"
}

module "waf" {
  source      = "../../"
  name        = "waf"
  environment = "test"
}
