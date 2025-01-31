output "public_subnets_id" {
  value = [aws_subnet.public_a_4dd.id, aws_subnet.public_b_4dd.id, aws_subnet.public_c_4dd.id]
}

output "private_subnets_id" {
  value = [aws_subnet.private_a_4dd.id, aws_subnet.private_b_4dd.id, aws_subnet.private_c_4dd.id]
}

output "security_group_id" {
  value = aws_security_group.default_4dd.id
}

output "vpc_id" {
  value = aws_vpc.main_4dd.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.igw_4dd.id
}

output "nat_gateway_a_id" {
  value = aws_nat_gateway.nat_a_4dd.id
}

output "nat_gateway_b_id" {
  value = aws_nat_gateway.nat_b_4dd.id
}

output "route_table_public_a_id" {
  value = aws_route_table.public_4dd.id
}

output "route_table_public_b_id" {
  value = aws_route_table.public_4dd.id
}

output "route_table_private_a_id" {
  value = aws_route_table.private_a_4dd.id
}

output "route_table_private_b_id" {
  value = aws_route_table.private_b_4dd.id
}

output "public_subnet_a_id" {
  value = aws_subnet.public_a_4dd.id
}

output "public_subnet_b_id" {
  value = aws_subnet.public_b_4dd.id
}

output "public_subnet_c_id" {
  value       = aws_subnet.public_c_4dd.id
}

output "private_subnet_a_id" {
  value = aws_subnet.private_a_4dd.id
}

output "private_subnet_b_id" {
  value = aws_subnet.private_b_4dd.id
}

output "private_subnet_c_id" {
  value = aws_subnet.private_c_4dd.id
}