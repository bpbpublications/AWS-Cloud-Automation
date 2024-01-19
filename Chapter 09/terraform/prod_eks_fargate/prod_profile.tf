resource "aws_eks_fargate_profile" "prod" {
  cluster_name           = aws_eks_cluster.cluster.name
  fargate_profile_name   = "prod"
  pod_execution_role_arn = aws_iam_role.eks-fargate-profile.arn

  subnet_ids = [
    aws_subnet.private-us-east-1a.id,
    aws_subnet.private-us-east-1b.id
  ]

  selector {
    namespace = "prod"
  }
}
