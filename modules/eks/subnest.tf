#Private subnet creation
resource "aws_subnet" "private_subnet_aps1a" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "10.0.148.0/22"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "mk-eksPrivate-aps1a"
    user = var.commontag
  }
}
resource "aws_subnet" "private_subnet_aps1b" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "10.0.152.0/22"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "mk-eksPrivate-aps1b"
    user = var.commontag
  }
}

#Public subnet creation
resource "aws_subnet" "public_subnet_aps1a" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "10.0.160.0/22"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "mk-eksPublic-aps1a"
    user = var.commontag
  }
}
resource "aws_subnet" "public_subnet_aps1b" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "10.0.164.0/22"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "mk-eksPublic-aps1b"
    user = var.commontag
  }
}
