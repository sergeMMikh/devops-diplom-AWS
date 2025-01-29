variable "vpc_id" {
  description = "ID VPC, в котором создаётся Security Group"
  type        = string
}

variable "allowed_ingress_ports" {
  description = "Список разрешённых входящих портов"
  type        = list(number)
  default     = [22, 80, 443]  # Можно добавить 22, если нужно SSH
}

variable "allowed_cidr_blocks" {
  description = "Список CIDR блоков, которым разрешён доступ"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
