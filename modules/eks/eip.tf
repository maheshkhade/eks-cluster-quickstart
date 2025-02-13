# Create Elastic IPs for each NAT Gateway
resource "aws_eip" "eip_aps1a" {
  domain = "vpc"
  tags = {
    user = var.commontag
    Name = "mk-eip-aps1a"
  }
}