resource "aws_subnet" "main" {
  vpc_id     = data.aws_vpc.test_main
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-central-1"

  tags = {
    Name = "test_main"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = data.aws_vpc.test_main
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "test_main"
  }
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id            = data.aws_vpc.test_main.id
  service_name      = "com.amazonaws.${data.aws_region.current.name}.s3"
  vpc_endpoint_type = "Gateway"
}