
output "s3_bucket_name" {
  description = "Имя S3 бакета"
  value       = module.s3.s3_bucket_name
}

output "s3_bucket_arn" {
  description = "ARN S3 бакета"
  value       = module.s3.s3_bucket_arn
}

output "s3_bucket_region" {
  description = "Регион S3 бакета"
  value       = module.s3.s3_bucket_region
}

output "s3_bucket_url" {
  description = "URL бакета для доступа"
  value       = module.s3.s3_bucket_url
}

output "test" {
  value = "test"  
}

output "eks_role_name" {
  value = module.iam.eks_role_name
}

output "eks_nodes_role_name" {
  value = module.iam.eks_nodes_role_name
}

output "aws_iam_role_arn" {
  value =  module.iam.aws_iam_role_arn  
}