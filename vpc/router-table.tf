resource "aws_route_table" "test_public_route_table" {
  vpc_id = aws_vpc.vpc-test-practice.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public_internet_gateway.id
  }
  tags = {
    Name = "RT Public: For test terraform Project "
  }
}

# resource "aws_route_table" "test_private_route_table" {
#   count      = length(var.cidr_private_subnet)
#   vpc_id = aws_vpc.vpc-test-practice.id
#   depends_on = [aws_nat_gateway.nat_gateway]
#   route {
#     cidr_block = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.nat_gateway[count.index].id
#   }
#   tags = {
#     Name = "RT Private: For test terraform Project "
#   }
# }


resource "aws_route_table" "test_private_route_table" {
  count      = length(var.cidr_private_subnet)
  vpc_id     = aws_vpc.vpc-test-practice.id
  depends_on = [aws_nat_gateway.nat_gateway]

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway[count.index].id  # Corrected line
  }
  
  tags = {
    Name = "RT Private: For test terraform Project "
  }
}




