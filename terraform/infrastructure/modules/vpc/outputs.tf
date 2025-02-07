output "public_subnets" {
  description = "Список ID публичных подсетей"
  value = [
    aws_subnet.public_a_4dd.id, 
    aws_subnet.public_b_4dd.id, 
    aws_subnet.public_c_4dd.id
  ]
}

output "private_subnets" {
  description = "Список ID приватных подсетей"
  value = [
    aws_subnet.private_a_4dd.id, 
    aws_subnet.private_b_4dd.id, 
    aws_subnet.private_c_4dd.id
  ]
}

output "security_group_id" {
  description = "ID security группы"
  value       = aws_security_group.default_4dd.id
}

output "vpc_id" {
  description = "ID VPC"
  value       = aws_vpc.main_4dd.id
}

output "internet_gateway_id" {
  description = "ID интернет-шлюза"
  value       = aws_internet_gateway.igw_4dd.id
}

output "nat_gateway_id" {
  description = "ID NAT Gateway (теперь один для всех)"
  value       = aws_nat_gateway.nat.id
}

output "route_table_public_id" {
  description = "ID публичной маршрутной таблицы"
  value       = aws_route_table.public.id
}

output "route_table_private_id" {
  description = "ID приватной маршрутной таблицы (общая)"
  value       = aws_route_table.private.id
}

output "public_subnet_a_id" {
  description = "ID публичной подсети A"
  value       = aws_subnet.public_a_4dd.id
}

output "public_subnet_b_id" {
  description = "ID публичной подсети B"
  value       = aws_subnet.public_b_4dd.id
}

output "public_subnet_c_id" {
  description = "ID публичной подсети C"
  value       = aws_subnet.public_c_4dd.id
}

output "private_subnet_a_id" {
  description = "ID приватной подсети A"
  value       = aws_subnet.private_a_4dd.id
}

output "private_subnet_b_id" {
  description = "ID приватной подсети B"
  value       = aws_subnet.private_b_4dd.id
}

output "private_subnet_c_id" {
  description = "ID приватной подсети C"
  value       = aws_subnet.private_c_4dd.id
}
