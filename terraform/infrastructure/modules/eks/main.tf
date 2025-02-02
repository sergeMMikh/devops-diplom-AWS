module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 20.0"
  cluster_name    = "k8s-eks-cluster"
  cluster_version = "1.31"

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  #   node_groups = {
  #     eks_nodes = {
  #       desired_capacity = 3
  #       min_size         = 3
  #       max_size         = 3
  #       instance_types   = ["t3.medium"]
  #     }
  #   }

  eks_managed_node_groups = {
    eks_nodes = { # <-- Добавляем название группы узлов
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["m5.medium"]
      min_size       = 3
      max_size       = 3
      desired_size   = 3
    }
  }

  tags = {
    Name      = "eks-cluster"
    Terraform = "true"
  }
}
