resource "aws_vpc" "main_4dd" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "VPC_for_diplom"
  }
}

resource "aws_internet_gateway" "igw_4dd" {
  vpc_id = aws_vpc.main_4dd.id

  tags = {
    Name = "InternetGateway_for_diplom"
  }
}


resource "aws_subnet" "public_a_4dd" {
  vpc_id            = aws_vpc.main_4dd.id
  cidr_block        = "10.10.10.0/24"  # Изменённый диапазон
  availability_zone = "eu-central-1a"

  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet_A_4dd"
  }
}

resource "aws_subnet" "public_b_4dd" {
  vpc_id            = aws_vpc.main_4dd.id
  cidr_block        = "10.10.11.0/24"  # Новый диапазон
  availability_zone = "eu-central-1b"

  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet_B_4dd"
  }
}

resource "aws_subnet" "public_c_4dd" {
  vpc_id            = aws_vpc.main_4dd.id
  cidr_block        = "10.10.12.0/24"  # Новый диапазон
  availability_zone = "eu-central-1c"

  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet_C_4dd"
  }
}


resource "aws_subnet" "private_a_4dd" {
  vpc_id            = aws_vpc.main_4dd.id
  cidr_block        = "10.10.20.0/24"  # Изменённый диапазон
  availability_zone = "eu-central-1a"

  tags = {
    Name = "PrivateSubnetA"
  }
}

resource "aws_subnet" "private_b_4dd" {
  vpc_id            = aws_vpc.main_4dd.id
  cidr_block        = "10.10.21.0/24"  # Новый диапазон
  availability_zone = "eu-central-1b"

  tags = {
    Name = "PrivateSubnetB"
  }
}

resource "aws_subnet" "private_c_4dd" {
  vpc_id            = aws_vpc.main_4dd.id
  cidr_block        = "10.10.22.0/24"  # Новый диапазон
  availability_zone = "eu-central-1c"

  tags = {
    Name = "PrivateSubnetС"
  }
}


resource "aws_route_table" "public_4dd" {
  vpc_id = aws_vpc.main_4dd.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_4dd.id
  }

  tags = {
    Name = "PublicRouteTable_4dd"
  }
}

resource "aws_route_table_association" "public_a_4dd" {
  subnet_id      = aws_subnet.public_a_4dd.id
  route_table_id = aws_route_table.public_4dd.id
}

resource "aws_route_table_association" "public_b_4dd" {
  subnet_id      = aws_subnet.public_b_4dd.id
  route_table_id = aws_route_table.public_4dd.id
}

resource "aws_route_table_association" "public_c_4dd" {
  subnet_id      = aws_subnet.public_c_4dd.id
  route_table_id = aws_route_table.public_4dd.id
}

# Elastic IP для NAT Gateway в зоне public_a
resource "aws_eip" "nat_a_4dd" {
  domain = "vpc"

  tags = {
    Name = "NAT-Gateway-A-EIP_4dd"
  }
}

# Elastic IP для NAT Gateway в зоне public_b
resource "aws_eip" "nat_b_4dd" {
  domain = "vpc"

  tags = {
    Name = "NAT-Gateway-B-EIP_4dd"
  }
}


# NAT-шлюз для public_a (eu-central-1a)
resource "aws_nat_gateway" "nat_a_4dd" {
  allocation_id = aws_eip.nat_a_4dd.id
  subnet_id     = aws_subnet.public_a_4dd.id

  tags = {
    Name = "NAT-Gateway-A_4dd"
  }

  depends_on = [aws_eip.nat_a_4dd, aws_internet_gateway.igw_4dd, aws_subnet.public_a_4dd]
}

# NAT-шлюз для public_b (eu-central-1b)
resource "aws_nat_gateway" "nat_b_4dd" {
  allocation_id = aws_eip.nat_b_4dd.id
  subnet_id     = aws_subnet.public_b_4dd.id

  tags = {
    Name = "NAT-Gateway-B_4dd"
  }

  depends_on = [aws_eip.nat_b_4dd, aws_internet_gateway.igw_4dd, aws_subnet.public_b_4dd]
}

resource "aws_route_table" "private_a_4dd" {
  vpc_id = aws_vpc.main_4dd.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_a_4dd.id  # Привязка к NAT в eu-central-1a
  }

  tags = {
    Name = "PrivateRouteTableA"
  }
}

# Таблица маршрутизации для private_b (eu-central-1b)
resource "aws_route_table" "private_b_4dd" {
  vpc_id = aws_vpc.main_4dd.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_b_4dd.id  # Привязка к NAT в eu-central-1b
  }

  tags = {
    Name = "PrivateRouteTableB"
  }
}

resource "aws_route_table" "private_c_4dd" {
  vpc_id = aws_vpc.main_4dd.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_b_4dd.id  # Используем NAT из зоны B
  }

  tags = {
    Name = "PrivateRouteTableC"
  }
}

# Ассоциация private_a с таблицей маршрутов private_a
resource "aws_route_table_association" "private_a_4dd" {
  subnet_id      = aws_subnet.private_a_4dd.id
  route_table_id = aws_route_table.private_a_4dd.id
}

# Ассоциация private_b с таблицей маршрутов private_b
resource "aws_route_table_association" "private_b_4dd" {
  subnet_id      = aws_subnet.private_b_4dd.id
  route_table_id = aws_route_table.private_b_4dd.id
}

resource "aws_route_table_association" "private_c_4dd" {
  subnet_id      = aws_subnet.private_c_4dd.id
  route_table_id = aws_route_table.private_c_4dd.id
}

resource "aws_security_group" "default_4dd" {
  vpc_id = aws_vpc.main_4dd.id

  dynamic "ingress" {
    for_each = ["80", "443", "22"]
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

