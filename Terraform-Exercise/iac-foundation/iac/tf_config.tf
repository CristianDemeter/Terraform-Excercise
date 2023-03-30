terraform {
  required_version = "~> 1.3.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.50.0"
    }
  }
  backend "s3" {}
}

provider "aws" {
  region = "eu-central-1"
  default_tags {
    tags = {
      managed_by = "terraform/application"
    }
  }
  ignore_tags {
    keys = [

    ]
  }
}
