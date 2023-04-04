output "vpc" {
  value = "aw-eu-pdw-vpc-<id>-${var.environment_char}-<num>"
}

output "s3" {
  value = "aw-eu-pdw-s3-<id>-${var.environment_char}-<num>"
}

output "kms" {
  value = "alias/aw-eu-pdw-kms-<id>-${var.environment_char}-<num>"
}

output "iam" {
  value = "aw-eu-pdw-iam-<id>-${var.environment_char}-<num>"
}

output "secret" {
  value = "aw-eu-pdw-secret-<id>-${var.environment_char}-<num>"
}

output "ec2" {
  value = "aw-eu-pdw-ec2-<id>-${var.environment_char}-<num>"
}