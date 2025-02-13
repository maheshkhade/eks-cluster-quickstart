resource "aws_eks_node_group" "mk-eks-nodegroup" {
  cluster_name    = aws_eks_cluster.mk_eks_cluster.name
  node_group_name = "mk-eks-nodegroup"
  node_role_arn   = aws_iam_role.eks_node_role.arn
  subnet_ids      = [aws_subnet.private_subnet_aps1a.id, aws_subnet.private_subnet_aps1b.id]
  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  remote_access {
    ec2_ssh_key               = "mk-eksKeyPair-aps1"
    source_security_group_ids = [aws_security_group.eks_nodes.id]
  }
  update_config {
    max_unavailable = 1
  }
  depends_on = [aws_eks_cluster.mk_eks_cluster]
}
