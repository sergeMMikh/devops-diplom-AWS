variable "vm_public_instance_type" {
  type        = string
  description = "The type of instance"
  default     = "t2.micro"
}

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


variable "iam_instance_profile" {
  description = "IAM profile for instance"
  type        = string
}
