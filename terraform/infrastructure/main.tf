data "terraform_remote_state" "bootstrap" {
  backend = "local"  # Или "s3", если хранишь state в S3

  config = {
    path = "../bootstrap/terraform.tfstate"  
  }
}

variable "s3_bucket_name" {
  description = "Имя S3 бакета, полученное из bootstrap"
  type        = string
  default     = "" 
}

output "s3_bucket_name_from_bootstrap" {
  value = data.terraform_remote_state.bootstrap.outputs.s3_bucket_name
}

module "eks" {
  source            = "./modules/eks"
  subnet_ids        = module.vpc.private_subnets
  vpc_id            = module.vpc.vpc_id
  ami_id            = module.ec2.ubuntu_ami_id
  key_name          = var.key_name
  security_group_id = module.security_group.security_group_id

  eks_role_name       = data.terraform_remote_state.bootstrap.outputs.eks_role_name
  eks_nodes_role_name = data.terraform_remote_state.bootstrap.outputs.eks_nodes_role_name
  aws_iam_role_arn    = data.terraform_remote_state.bootstrap.outputs.aws_iam_role_arn
}


module "vpc" {
  source = "./modules/vpc"
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
  allowed_ingress_ports = [
    22,
    80,
    443,
    6443,
    2379,
    2380,
    8080,
    10250,
    10251,
    10252,
    30000,
    32767,
    10248
  ]
  allowed_cidr_blocks = ["0.0.0.0/0"]
}

module "ec2" {
  source = "./modules/ec2"
}
