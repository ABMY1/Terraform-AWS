resource "aws_internet_gateway" "public_internet_gateway" {
  vpc_id = aws_vpc.vpc-test-practice.id
  tags = {
    Name = "IGW: For test_terraform"
  }
}