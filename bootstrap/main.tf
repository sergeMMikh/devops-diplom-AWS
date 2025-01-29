module "s3" {
  source = "./modules/s3"

  Owner = var.Owner
}


# module "iam" {
#   source                = "./modules/iam"
#   role_name             = "ec2-s3-access-role"
#   policy_name           = "ec2-s3-write-policy"
#   s3_bucket_arn         = "arn:aws:s3:::hw-smmikh-january-2025-store-bucket"
#   instance_profile_name = "ec2-instance-profile"
# }


