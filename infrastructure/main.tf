module "vpc" {
  source = "./modules/vpc"
}

module "security_group" {
  source                = "./modules/security_group"
  vpc_id                = module.vpc.vpc_id
  allowed_ingress_ports = [80, 443]
  allowed_cidr_blocks   = ["0.0.0.0/0"]
}

module "ec2" {
  source = "./modules/ec2"

  # Тип инстанса
  vm_public_instance_type = var.vm_public_instance_type

  # Доступ по SSH
  key_name = var.key_name

  # Теги проекта
  Owner    = var.Owner
  Project  = var.Project
  Platform = var.Platform

  # Сеть
  subnet_ids         = [module.vpc.public_subnet_a_id, module.vpc.public_subnet_b_id]
  public_subnets_id  = module.vpc.public_subnets_id
  private_subnet_id  = module.vpc.private_subnets_id
  security_group_id  = module.vpc.security_group_id
  vpc_id             = module.vpc.vpc_id

  # Хранение
  # s3_image_url = var.s3_bucket_name
  # s3_image_url = data.terraform_remote_state.bootstrap.outputs.s3_bucket_name
  # s3_bucket_arn  = data.terraform_remote_state.bootstrap.outputs.s3_bucket_arn

  # IAM
  iam_instance_profile = module.iam.instance_profile_name
}

module "iam" {
  source                = "./modules/iam"
  role_name             = "ec2-s3-access-role"
  policy_name           = "ec2-s3-write-policy"
  # s3_bucket_arn         = "arn:aws:s3:::hw-smmikh-january-2025-store-bucket"
  instance_profile_name = "ec2-instance-profile"
}


# data "terraform_remote_state" "bootstrap" {
#   backend = "s3"
#   config = {
#     bucket = "terraform-state-bucket" # S3-бакет, где хранится `bootstrap`-state
#     key    = "bootstrap/terraform.tfstate"
#     region = "us-east-1"
#   }
# }

