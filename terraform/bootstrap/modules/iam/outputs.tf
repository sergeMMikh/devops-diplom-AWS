output "eks_role_name" {
  description = "IAM Role for EKS Cluster"
  value       = aws_iam_role.eks.name
}

output "eks_nodes_role_name" {
  description = "IAM Role for EKS Nodes"
  value       = aws_iam_role.eks_nodes.name
}

output "dd_service_role_name" {
  description = "IAM Role for General EC2 Service"
  value       = aws_iam_role.dd_service_role.name
}

output "policy_arn" {
  description = "IAM Policy ARN for S3 Write Access"
  value       = aws_iam_policy.s3_write_policy.arn
}

output "aws_iam_role_arn" {
  description = "IAM EKS Role ARN "
  value =  aws_iam_role.eks.arn  
}
