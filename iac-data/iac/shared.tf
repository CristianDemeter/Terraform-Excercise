# instantiate naming module

module "naming" {
  source = "./modules/naming"

  environment_char = var.environment_char
}


# get account info

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}
