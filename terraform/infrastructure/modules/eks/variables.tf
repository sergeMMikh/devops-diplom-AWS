variable "vpc_id" {
  description = "VPC ID для EKS"
  type        = string
}

variable "subnet_ids" {
  description = "Список приватных подсетей для EKS"
  type        = list(string)
}

