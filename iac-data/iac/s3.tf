#TODO

locals {

  s3_custom_bucket_policy_path = "${path.root}/../vars/s3_bucket_policies/${var.environment}/<bucket_id>.json"
  s3_default_bucket_policy     = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "denyInsecureTransport",
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": [
        "<bucket_arn>/*",
        "<bucket_arn>"
      ],
      "Condition": {
        "Bool": {
          "aws:SecureTransport": "false"
        }
      }
    }
  ]
}
EOF
}

module "s3_bucket" {
  source = "./modules/s3_bucket"

  for_each = var.s3.bucket

  bucket_id = replace(replace(module.naming.s3, "<id>", each.key), "<num>", "001")
  bucket_policy = (
    fileexists(replace(local.s3_custom_bucket_policy_path, "<bucket_id>", each.key)) ?
    file(replace(local.s3_custom_bucket_policy_path, "<bucket_id>", each.key))
    : local.s3_default_bucket_policy
  )
  cmk_arn = data.aws_kms_key.s3.arn
}
