# terraform-aws-waf basic example

This is a basic example of the `terraform-aws-waf` module.

## Usage

```hcl
module "waf" {
  source      = "clouddrove/waf/aws"
  name        = "waf"
  environment = "test"
}
```
