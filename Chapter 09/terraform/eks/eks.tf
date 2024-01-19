module "eks"{

    source = "terraform-aws-modules/eks/aws"
    version = "17.1.0"
    cluster_name = local.cluster_name
    cluster_version = "1.25"

    subnets = module.vpc.private_subnets

    tags = {

        Name = "Demo-EKS-Cluster"
        CreatedBy   = "James Odeyinka"
        DateCreated = "03-19-2023"
        Env         = "Demo"

    }

    vpc_id = module.vpc.vpc_id

    workers_group_defaults = {

        root_volume_type = "gp2"

    }

    worker_groups = [

        {

            name = "First-Group"
            instance_type = "t2.micro"
            asg_desired_capacity = 2
            additional_security_group_ids = [aws_security_group.demo-worker-group-one.id]

        },

        {
            name = "Second-Group"
            instance_type = "t2.micro"
            asg_desired_capacity = 1
            additional_security_group_ids = [aws_security_group.demo-worker-group-two.id]

        },

    ]

}


data "aws_eks_cluster" "cluster" {

    name = module.eks.cluster_id

}


data "aws_eks_cluster_auth" "cluster" {

    name = module.eks.cluster_id
    
}
