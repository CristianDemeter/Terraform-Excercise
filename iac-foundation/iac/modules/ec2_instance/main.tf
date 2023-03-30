resource "aws_instance" "bastion" {
  ami                     = var.ec2.ami
  instance_type           = var.ec2.instance_type
  iam_instance_profile    = aws_iam_instance_profile.bastion_profile.name
  subnet_id              = ""
  vpc_security_group_ids = ""
}

resource "aws_iam_instance_profile" "bastion_profile" {
  name = replace(replace(module.naming.iam, "<id>", "bastion"), "<num>", "001")
  role = aws_iam_role.bastion_role.name
}

resource "aws_iam_role" "bastion" {
  name = replace(replace(module.naming.iam, "<id>", "bastion"), "<num>", "001")

  #This trust relationship effect allows the AssumeRole action to utilize the ec2 services
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "iam_role_policy" "bastion_role_policy" {
  name   = "bastion_role_policy_secretsmanager"
  role   = aws_iam_role.bastion.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "secretsmanager:GetResourcePolicy",
        "secretsmanager:GetSecretValue",
        "secretsmanager:DescribeSecret",
        "secretsmanager:ListSecretVersionIds"
      ],
      "Resource": [
        "*"
      ]
    }
  ]
}
EOF
}