module "naming" {
  source = "./modules/naming"

  environment_char = var.environment_char
}

# Get VPC's

data "aws_vpc" "selected" {
  id = var.vpc_id
}

# AWS Info

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}