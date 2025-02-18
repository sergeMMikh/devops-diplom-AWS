variable "vpc_id" {
  description = "VPC ID для EKS"
  type        = string
}

variable "subnet_ids" {
  description = "Список приватных подсетей для EKS"
  type        = list(string)
}

variable "key_name" {
  type        = string
  description = "The Key pair name"
  sensitive   = true
}

variable "security_group_id" {
  description = "ID of the security group to associate with instances"
  type        = string
}

variable "node_instance_type" {
  type = string
  description = "The instance type for node"
  default = "m5.medium"
}

variable "ami_id" {
  description = "Ubuntu AMI ID for EKS worker nodes"
  type        = string
}

variable "eks_role_name" {
  description = "IAM Role for EKS Cluster"
  type        = string
}

variable "eks_nodes_role_name" {
  description = "IAM Role for EKS Nodes"
  type        = string
}

variable "aws_iam_role_arn" {
  description = "IAM Role ARN for EKS Cluster"
  type        = string
}
