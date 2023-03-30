resource "aws_vpc_endpoint" "s3" {
  vpc_id            = data.aws_vpc.main_vpc.id
  service_name      = "com.amazonaws.${data.aws_region.current.name}.s3"
  vpc_endpoint_type = "Gateway"
}
