output "s3_bucket_name" {
  description = "Имя S3 бакета"
  value       = aws_s3_bucket.backend_dd.id
}

output "s3_bucket_arn" {
  description = "ARN S3 бакета"
  value       = aws_s3_bucket.backend_dd.arn
}

output "s3_bucket_region" {
  description = "Регион S3 бакета"
  value       = aws_s3_bucket.backend_dd.region
}

output "s3_bucket_url" {
  description = "URL бакета для доступа"
  value       = "https://${aws_s3_bucket.backend_dd.bucket}.s3.${aws_s3_bucket.backend_dd.region}.amazonaws.com"
}
