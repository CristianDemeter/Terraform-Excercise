output "vpc" {
  value = "aw-eu-practice-vpc-<id>-${var.environment_char}-<num>"
}

output "ec2" {
  value = "aw-eu-practice-ec2-<id>-${var.environment_char}-<num>"
}

output "s3" {
  value = "aw-eu-practice-s3-<id>-${var.environment_char}-<num>"
}

output "iam" {
  value = "aw-eu-practice-iam-<id>-${var.environment_char}-<num>"
}

output "kms" {
  value = "alias/aw-eu-practice-kms-<id>-${var.environment_char}-<num>"
}

output "sg_name" {
  value = "aw-eu-sg-practice-<id>-${var.environment_char}-<num>"
}