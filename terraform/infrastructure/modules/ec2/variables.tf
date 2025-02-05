variable "key_name" {
  type        = string
  description = "The Key pair name"
  sensitive   = true
}


variable "Owner" {
  type        = string
  description = "The project owner"
  default     = "SMMikh"
}

variable "Project" {
  type        = string
  description = "Project_name"
  default     = "hw_cloud_providers_networking"
}

variable "Platform" {
  type        = string
  description = "The instance platform"
  default     = "Ubuntu"
}

variable "subnet_ids" {
  description = "List of subnet IDs where Kubernetes nodes will be deployed"
  type        = list(string)
}

variable "public_subnets_id" {
  description = "ID list of the public subnet"
  type        = list(string)
}

variable "private_subnet_id" {
  description = "ID list of the private subnet"
  type        = list(string)
}

variable "security_group_id" {
  description = "ID of the security group to associate with instances"
  type        = string
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC"
}

variable "master_instance_type" {
  description = "Тип инстанса для master node (от 2 CPU, 2GB RAM)"
  type        = string
  default     = "t3.large"
}

variable "worker_instance_type" {
  description = "Тип инстанса для worker node (от 1 CPU, 1GB RAM)"
  type        = string
  default     = "t3.small"
}

variable "master_disk_size" {
  description = "Размер диска для master node (от 50GB)"
  type        = number
  default     = 100
}

variable "worker_disk_size" {
  description = "Размер диска для worker node (от 100GB)"
  type        = number
  default     = 100
}
