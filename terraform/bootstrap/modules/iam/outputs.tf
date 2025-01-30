output "role_name" {
  value = aws_iam_role.dd-service-role.name
}

output "policy_arn" {
  value = aws_iam_policy.s3_write_policy.arn
}


