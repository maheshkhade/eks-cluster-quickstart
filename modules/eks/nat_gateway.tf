# Create NAT Gateway for each AZ
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.eip_aps1a.id
  subnet_id     = aws_subnet.public_subnet_aps1a.id
  tags = {
    Name = "mk-nat_gw"
    user = var.commontag
  }
}