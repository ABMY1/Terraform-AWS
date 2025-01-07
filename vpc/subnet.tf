# Setup public subnet
resource "aws_subnet" "aws_practice_public_subnets" {
  count      = length(var.cidr_public_subnet)
  vpc_id     = aws_vpc.vpc-test-practice.id
  cidr_block = element(var.cidr_public_subnet, count.index)
  availability_zone = element(var.ap_availability_zone, count.index)

  tags = {
    Name = "Subnet-Public : Public Subnet ${count.index + 1} "
  }
}

# Setup private subnet
resource "aws_subnet" "aws_practice_private_subnets" {
  count      = length(var.cidr_private_subnet)
  vpc_id     = aws_vpc.vpc-test-practice.id
  cidr_block = element(var.cidr_private_subnet, count.index)
  availability_zone = element(var.ap_availability_zone, count.index)

  tags = {
    Name = "Subnet-Private : Private Subnet ${count.index + 1}"
  }
}

