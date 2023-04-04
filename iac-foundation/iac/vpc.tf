resource "aws_vpc" "main" {
 cidr_block = "10.0.0.0/16"
 tags = {
   Name = "Excercise VPC"
 }
}

resource "aws_subnet" "public_subnets" {
 name       = replace(replace(module.naming.vpc, "<id>", "publicsubnet"), "<num>", "01")
 count      = length(var.public_subnet_cidrs)
 vpc_id     = aws_vpc.main.id
 cidr_block = element(var.public_subnet_cidrs, count.index)
}

resource "aws_subnet" "private_subnets" {
name       = replace(replace(module.naming.vpc, "<id>", "privatesubnet"), "<num>", "01")
count      = length(var.private_subnet_cidrs)
vpc_id     = aws_vpc.main.id
cidr_block = element(var.private_subnet_cidrs, count.index)
}

/*
resource "aws_vpc_endpoint" "s3" {
  vpc_id            = data.aws_vpc.test_main.id
  service_name      = "com.amazonaws.${data.aws_region.current.name}.s3"
  vpc_endpoint_type = "Gateway"
}
*/