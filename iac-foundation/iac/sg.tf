# Bastion host SG

resource "aws_security_group" "bastion_host" {
  name        = replace(replace(module.naming.sg_name, "<id>", "bastionhost"), "<num>", "01")
  description = "Security group for the EC2 bastion host"
  # TODO, correct?
  vpc_id      = aws_vpc.main.id
}

resource "aws_security_group_rule" "bastion_host_all_outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.bastion_host.id
}

# Loader host SG

resource "aws_security_group" "loader" {
  name        = replace(replace(module.naming.sg_name, "<id>", "loader"), "<num>", "01")
  description = "Security group for the EC2 loader"
  # TODO, correct?
  vpc_id      = aws_vpc.main.id
}

resource "aws_security_group_rule" "loader_ssh_inbound" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "ssh"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.loader.id
}

resource "aws_security_group_rule" "loader_all_outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.loader.id
}