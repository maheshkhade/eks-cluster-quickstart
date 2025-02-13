variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for EKS"
  type        = string
  default     = "1.30"
}

variable "endpoint_private_access" {
  description = "Enable private API access"
  type        = bool
  default     = true
}

variable "endpoint_public_access" {
  description = "Enable public API access"
  type        = bool
  default     = false
}

variable "public_access_cidrs" {
  description = "CIDR blocks that can access the EKS public endpoint. Use a more specific CIDR range like your office, VPN, or bastion host IP"
  type        = list(string)
  default     = ["203.0.113.0/32"] # Change this to a more secure range
}

variable "commontag" {
  description = "tag included in all resources"
  type        = string
}

variable "ec2_ssh_key" {
  description = "tag included in all resources"
  type        = string
}
