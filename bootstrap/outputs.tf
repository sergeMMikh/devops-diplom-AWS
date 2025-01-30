# ✅ S3 бакет
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

