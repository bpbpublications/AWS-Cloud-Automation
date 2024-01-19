resource "aws_efs_file_system" "eks-efs" {
  creation_token = "eks"

  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"
  encrypted        = true

   lifecycle_policy {
     transition_to_ia = "AFTER_30_DAYS"
   }

  tags = {
    Name          = "eks-efs"
    CreatedBy     = "James Odeyinka"
    DateCreated   = "03-19-2023"
    Env           = "Demo"
  }
}

resource "aws_efs_mount_target" "zone-a" {
  file_system_id  = aws_efs_file_system.eks-efs.id
  subnet_id       = aws_subnet.private-us-east-1a.id
  security_groups = [aws_eks_cluster.cluster.vpc_config[0].cluster_security_group_id]
}

resource "aws_efs_mount_target" "zone-b" {
  file_system_id  = aws_efs_file_system.eks-efs.id
  subnet_id       = aws_subnet.private-us-east-1b.id
  security_groups = [aws_eks_cluster.cluster.vpc_config[0].cluster_security_group_id]
}

