module "s3" {
  source         = "./modules/s3"
  Owner          = var.Owner
  s3_bucket_name = var.s3_bucket_name
}

module "iam" {
  source         = "./modules/iam"
  role_name      = "dd-service-role"
  policy_name    = "ec2-s3-write-policy"
  s3_bucket_name = var.s3_bucket_name
}

