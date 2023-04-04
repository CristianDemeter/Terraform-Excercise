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
      managed_by = "terraform/data"
    }
  }
  ignore_tags {
    keys = [
      "map-migrated",
      "application_name",
      "application_owner",
      "business_unit",
      "company",
      "environment",
      "ict_digital",
      "in_service",
      "is_shared",
      "ito_provider",
      "sharing_target_app",
      "sharing_target_app_prc",
      "sharing_target_bu",
      "sharing_target_bu_prc"
    ]
  }
}