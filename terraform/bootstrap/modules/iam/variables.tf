variable "role_name" {
  description = "Name of the IAM Role for EC2"
  type        = string
  default     = "dd-service-role"
}

variable "policy_name" {
  description = "Name of the IAM Policy"
  type        = string
  default     = "ec2-s3-write-policy"
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "env" {
  description = "Deployment environment"
  type        = string
}

variable "eks_name" {
  description = "EKS cluster name"
  type        = string
}

variable "account_id" {
  description = "AWS Account ID"
  type        = string
}