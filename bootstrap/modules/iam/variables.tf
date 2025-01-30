variable "role_name" {
  description = "Name of the IAM Role"
  type        = string
  default     = "dd-service-role"
}

variable "policy_name" {
  description = "Name of the IAM Policy"
  type        = string
  default     = "ec2-s3-write-policy"
}


variable "instance_profile_name" {
  description = "Name of the IAM Instance Profile"
  type        = string
}


variable "s3_bucket_name" {
  type = string
  description = "s3 bucket name"
}