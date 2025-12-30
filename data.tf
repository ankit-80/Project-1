data "aws_vpc" "vpc_available" {
  filter {
    name   = "tag:Name"
    values = ["hdfc-mobilebanking*"]
  }
}
data "aws_subnets" "available_db_subnet" {
 // vpc_id = data.aws_vpc.vpc_available.id
  filter {
    name   = "tag:Name"
    values = ["hdfc-mobilebanking*"]
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}
data "aws_security_group" "tcw_sg" {
  filter {
    name   = "tag:Name"
    values = ["hdfc-mobilebanking*"]
  }
}
