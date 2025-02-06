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

  # Доступ по SSH
  key_name = var.key_name

  # Теги проекта
  Owner    = var.Owner
  Project  = var.Project
  Platform = var.Platform

  # Сеть
  subnet_ids        = [module.vpc.public_subnet_a_id, module.vpc.public_subnet_b_id]
  public_subnets_id = module.vpc.public_subnets_id
  private_subnet_id = module.vpc.private_subnets_id
  security_group_id = module.vpc.security_group_id
  vpc_id            = module.vpc.vpc_id

}


module "eks" {
  source     = "./modules/eks"
  subnet_ids = module.vpc.private_subnets_id
  vpc_id     = module.vpc.vpc_id
  ami_id     = module.ec2.ubuntu_ami_id
    # Доступ по SSH
  key_name = var.key_name
  security_group_id = module.vpc.security_group_id
}
