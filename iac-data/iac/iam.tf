# ec2 loader policy

resource "aws_iam_role_policy" "ec2_loader" {
  name = "ec2_loader_s3_access"
  role = replace(replace(module.naming.iam, "<id>", "loader"), "<num>", "001")
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:ListBucket"],
      "Resource": [
        "${module.s3_bucket["stgarea"].bucket_arn}"
      ]
    },
    {
      "Effect": "Allow",
      "Action": ["s3:*Object"],
      "Resource": [
        "${module.s3_bucket["stgarea"].bucket_arn}/*"
      ]
    }
  ]
}
EOF
}