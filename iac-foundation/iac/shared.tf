module "naming" {
  source = "./modules/naming"

  environment_char = var.environment_char
}

# get VPC config

/*
data "aws_vpc" "test_main" {
  filter {
    name   = "tag:Name"
    values = ["test-vpc"]
  }
}
*/

# AWS Info

data "aws_caller_identity" "current" {

}

data "aws_region" "current" {

}