# resource "aws_route53_zone" "private_hosted_zone" {
#   name = "mahesh.com"
#   vpc {
#     vpc_id = aws_vpc.eks_vpc.id
#   }
# }

# resource "aws_route53_record" "service_one_a_record" {
#   zone_id = aws_route53_zone.private_hosted_zone.zone_id  # Hosted Zone ID for mahesh.com
#   name    = "service-one.mahesh.com"  # The subdomain you are creating the A record for
#   type    = "A"                       # A record type for IPv4
#   ttl     = "60"                     # Time to Live in seconds

#   # Value should be the IP address or other targets (such as an ELB or an EC2 instance)
#   records = ["172.20.111.78"]      # Replace with the actual IP address
# }