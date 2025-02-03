module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 20.0"
  cluster_name    = "k8s-eks-cluster"
  cluster_version = "1.31"

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  eks_managed_node_groups = {
    eks_nodes = { # <-- Добавляем название группы узлов
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["t2.medium"]
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

resource "aws_launch_template" "eks_nodes" {
  name_prefix   = "eks-node"
  image_id      = var.ami_id
  instance_type = var.node_instance_type
  key_name      = var.key_name  # Подключаем SSH-ключ

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.security_group_id]  # Используем security_group из модуля
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "eks-node"
    }
  }
}


data "aws_instances" "eks_worker_nodes" {
  instance_tags = {
    "eks:nodegroup-name" = "eks_nodes"
  }
}


