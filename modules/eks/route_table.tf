resource "aws_route_table" "eks_public_route_table" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "mk-eksPublic"
    user = var.commontag
  }
}

resource "aws_route_table" "eks_private_route_table" {
  vpc_id = aws_vpc.eks_vpc.id
  tags = {
    Name = "mk-eksPrivate"
    user = var.commontag
  }
}

resource "aws_route_table_association" "privateSubnetaps1a" {
  subnet_id      = aws_subnet.private_subnet_aps1a.id
  route_table_id = aws_route_table.eks_private_route_table.id
}
resource "aws_route_table_association" "privateSubnetaps1b" {
  subnet_id      = aws_subnet.private_subnet_aps1b.id
  route_table_id = aws_route_table.eks_private_route_table.id
}

resource "aws_route_table_association" "publicSubnetaps1a" {
  subnet_id      = aws_subnet.public_subnet_aps1a.id
  route_table_id = aws_route_table.eks_public_route_table.id
}
resource "aws_route_table_association" "publicSubnetaps1b" {
  subnet_id      = aws_subnet.public_subnet_aps1b.id
  route_table_id = aws_route_table.eks_public_route_table.id
}

resource "aws_route" "private_subnet_route" {
  route_table_id         = aws_route_table.eks_private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gw.id
}