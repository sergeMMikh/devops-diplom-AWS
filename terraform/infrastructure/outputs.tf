# VPC
output "vpc_id" {
  description = "ID созданной VPC"
  value       = module.vpc.vpc_id
}

# Public и Private Subnets
output "public_subnets_id" {
  description = "ID всех публичных подсетей"
  value       = module.vpc.public_subnets
}

output "private_subnets_id" {
  description = "ID всех приватных подсетей"
  value       = module.vpc.private_subnets
}

output "public_subnet_a_id" {
  description = "ID публичной подсети A"
  value       = module.vpc.public_subnet_a_id
}

output "public_subnet_b_id" {
  description = "ID публичной подсети B"
  value       = module.vpc.public_subnet_b_id
}

output "private_subnet_a_id" {
  description = "ID приватной подсети A"
  value       = module.vpc.private_subnet_a_id
}

output "private_subnet_b_id" {
  description = "ID приватной подсети B"
  value       = module.vpc.private_subnet_b_id
}

# Интернет-шлюз и NAT-шлюзы
output "internet_gateway_id" {
  description = "ID Internet Gateway"
  value       = module.vpc.internet_gateway_id
}

output "nat_gateway_id" {
  description = "ID NAT Gateway A"
  value       = module.vpc.nat_gateway_id
}

output "load_balancer_dns_name" {
  description = "DNS-имя ALB"
  value       = module.load_balancer.load_balancer_dns_name
}

output "load_balancer_security_group_id" {
  description = "ID Security Group для Load Balancer"
  value       = module.load_balancer.load_balancer_security_group_id
}
