variable "vpc_id" {
  description = "ID VPC, в котором создаётся Security Group"
  type        = string
}

variable "allowed_ingress_ports" {
  description = "Список разрешённых входящих портов"
  type        = list(number)
  # default = [
  #   22,
  #   80,
  #   443,
  #   6443,
  #   2379,
  #   2380,
  #   8080,
  #   10250,
  #   10251,
  #   10252,
  #   30000,
  #   32767
  # ]
}

variable "allowed_cidr_blocks" {
  description = "Список CIDR блоков, которым разрешён доступ"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}


