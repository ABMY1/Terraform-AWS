

# resource "aws_eip" "nat_eip" {
#   count = length(var.cidr_private_subnet)
#   vpc = true
# }

# resource "aws_nat_gateway" "nat_gateway" {
#   count      = length(var.cidr_private_subnet)
#   depends_on = [aws_eip.nat_eip[count.index].id]
#   allocation_id = aws_eip.nat_eip.id
#   subnet_id = aws_subnet.aws_practice_private_subnets[count.index].id
#   tags = {
#     "Name" = "Private NAT GW: For test_terraform  Project "
#   }
# }

resource "aws_eip" "nat_eip" {
  count = length(var.cidr_private_subnet)
  vpc = true
}

resource "aws_nat_gateway" "nat_gateway" {
  count         = length(var.cidr_private_subnet)
  allocation_id = aws_eip.nat_eip[count.index].id
  subnet_id     = aws_subnet.aws_practice_private_subnets[count.index].id
  depends_on    = [aws_eip.nat_eip]  # Reference the entire resource

  tags = {
    "Name" = "Private NAT GW: For test_terraform Project"
  }
}
