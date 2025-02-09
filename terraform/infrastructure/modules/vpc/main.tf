# Создание VPC
resource "aws_vpc" "main_4dd" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${local.env}-main"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw_4dd" {
  vpc_id = aws_vpc.main_4dd.id

  tags = {
    Name = "${local.env}-igw"
  }
}

# Публичные подсети
resource "aws_subnet" "public_a_4dd" {
  vpc_id                  = aws_vpc.main_4dd.id
  cidr_block              = "10.10.10.0/24"
  availability_zone       = local.zone1
  map_public_ip_on_launch = true

  tags = {
    "Name"                                                 = "${local.env}-public-${local.zone1}"
    "kubernetes.io/role/elb"                               = "1"
    "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"
  }
}

resource "aws_subnet" "public_b_4dd" {
  vpc_id                  = aws_vpc.main_4dd.id
  cidr_block              = "10.10.11.0/24"
  availability_zone       = local.zone2
  map_public_ip_on_launch = true

  tags = {
    "Name"                                                 = "${local.env}-public-${local.zone2}"
    "kubernetes.io/role/elb"                               = "1"
    "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"
  }
}

resource "aws_subnet" "public_c_4dd" {
  vpc_id                  = aws_vpc.main_4dd.id
  cidr_block              = "10.10.12.0/24"
  availability_zone       = local.zone3
  map_public_ip_on_launch = true

  tags = {
    "Name"                                                 = "${local.env}-public-${local.zone3}"
    "kubernetes.io/role/elb"                               = "1"
    "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"
  }
}

# Приватные подсети
resource "aws_subnet" "private_a_4dd" {
  vpc_id            = aws_vpc.main_4dd.id
  cidr_block        = "10.10.20.0/24"
  availability_zone = local.zone1

  tags = {
    "Name"                                                 = "${local.env}-private-${local.zone1}"
    "kubernetes.io/role/internal-elb"                      = "1"
    "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"
  }
}

resource "aws_subnet" "private_b_4dd" {
  vpc_id            = aws_vpc.main_4dd.id
  cidr_block        = "10.10.21.0/24"
  availability_zone = local.zone2

  tags = {
    "Name"                                                 = "${local.env}-private-${local.zone2}"
    "kubernetes.io/role/internal-elb"                      = "1"
    "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"
  }
}

resource "aws_subnet" "private_c_4dd" {
  vpc_id            = aws_vpc.main_4dd.id
  cidr_block        = "10.10.22.0/24"
  availability_zone = local.zone3

  tags = {
    "Name"                                                 = "${local.env}-private-${local.zone3}"
    "kubernetes.io/role/internal-elb"                      = "1"
    "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"
  }
}

# Публичная маршрутная таблица
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main_4dd.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_4dd.id
  }

  tags = {
    Name = "${local.env}-public"
  }
}

# Elastic IP для NAT Gateway
resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "${local.env}-nat"
  }
}

# Один NAT Gateway в первой публичной подсети
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_a_4dd.id

  tags = {
    Name = "${local.env}-nat"
  }

  depends_on = [aws_internet_gateway.igw_4dd]
}

# Приватные маршрутные таблицы с NAT
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main_4dd.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "${local.env}-private"
  }
}

# Ассоциации маршрутных таблиц
resource "aws_route_table_association" "private_a" {
  subnet_id      = aws_subnet.private_a_4dd.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_b" {
  subnet_id      = aws_subnet.private_b_4dd.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_c" {
  subnet_id      = aws_subnet.private_c_4dd.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public_zone1" {
  subnet_id      = aws_subnet.public_a_4dd.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_zone2" {
  subnet_id      = aws_subnet.public_b_4dd.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_zone3" {
  subnet_id      = aws_subnet.public_c_4dd.id
  route_table_id = aws_route_table.public.id
}

# Security Group
resource "aws_security_group" "default_4dd" {
  vpc_id = aws_vpc.main_4dd.id

  dynamic "ingress" {
    for_each = [
      "22", "80", "443", "6443", "2379", "2380", "8080",
      "10250", "10251", "10252", "30000", "32767", "10248"
    ]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MySecurityGroup"
  }
}

# # Оптимизированный вариант с использованием циклов.
# # Некогда было пробовать.
# variable "azs" {
#   description = "Список Availability Zones"
#   type        = list(string)
#   default     = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
# }

# variable "public_subnets" {
#   description = "CIDR для публичных подсетей"
#   type        = list(string)
#   default     = ["10.10.10.0/24", "10.10.11.0/24", "10.10.12.0/24"]
# }

# variable "private_subnets" {
#   description = "CIDR для приватных подсетей"
#   type        = list(string)
#   default     = ["10.10.20.0/24", "10.10.21.0/24", "10.10.22.0/24"]
# }

# # Публичные подсети
# resource "aws_subnet" "public" {
#   for_each = { for idx, cidr in var.public_subnets : idx => cidr }

#   vpc_id            = aws_vpc.main_4dd.id
#   cidr_block        = each.value
#   availability_zone = var.azs[each.key]
#   map_public_ip_on_launch = true

#   tags = {
#     "Name" = "${local.env}-public-${var.azs[each.key]}"
#     "kubernetes.io/role/elb" = "1"
#     "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"
#   }
# }

# # Приватные подсети
# resource "aws_subnet" "private" {
#   for_each = { for idx, cidr in var.private_subnets : idx => cidr }

#   vpc_id            = aws_vpc.main_4dd.id
#   cidr_block        = each.value
#   availability_zone = var.azs[each.key]

#   tags = {
#     "Name" = "${local.env}-private-${var.azs[each.key]}"
#     "kubernetes.io/role/internal-elb" = "1"
#     "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"
#   }
# }
