resource "aws_eks_cluster" "mk_eks_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eksrole.arn
  version  = var.cluster_version
  vpc_config {
    subnet_ids              = [aws_subnet.private_subnet_aps1a.id, aws_subnet.private_subnet_aps1b.id]
    endpoint_private_access = true
    endpoint_public_access  = true
    security_group_ids      = [aws_security_group.eks_cluster.id]
    public_access_cidrs     = var.public_access_cidrs #If you don't need public access, consider setting endpoint_public_access = false and using a bastion host or a VPN to access the cluster.
  }
  access_config {
    authentication_mode                         = "API_AND_CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true
  }
  tags = {
    Name = var.cluster_name
    user = var.commontag
  }
  depends_on = [aws_security_group.eks_cluster]
}

resource "aws_eks_addon" "vpc_cni" {
  cluster_name  = aws_eks_cluster.mk_eks_cluster.name
  addon_name    = "vpc-cni"
  addon_version = "v1.18.1-eksbuild.3" # Example version, check AWS for the latest version
  depends_on    = [aws_eks_cluster.mk_eks_cluster]
}

resource "aws_eks_addon" "kube_proxy" {
  cluster_name  = aws_eks_cluster.mk_eks_cluster.name
  addon_name    = "kube-proxy"
  addon_version = "v1.30.0-eksbuild.3" # Example version
  depends_on    = [aws_eks_cluster.mk_eks_cluster]
}

resource "aws_eks_addon" "coredns" {
  #always create after nodegroup creation.
  cluster_name  = aws_eks_cluster.mk_eks_cluster.name
  addon_name    = "coredns"
  addon_version = "v1.11.1-eksbuild.8" # Example version
  depends_on    = [aws_eks_cluster.mk_eks_cluster, aws_eks_node_group.mk-eks-nodegroup]
}


# k8s version - 1.30
# Upgrade policy - Extended
# Bootstrap cluster administrator access - Allow cluster administrator access
# Cluster authentication mode - EKS API
# Choose cluster IP address family - ipv4
# Cluster endpoint access - public and Private
#         Advanced settings - Add/edit sources to public access endpoint. - 0.0.0.0/0
# add-on coreDNS-v1.11.1-eksbuild.8, Amazon VPC CNI-v1.18.1-eksbuild.3, Kube-proxy-v1.30.0-eksbuild.3, AMAZON EKS pod Identity agent-v1.3.2-eksbuild.2.