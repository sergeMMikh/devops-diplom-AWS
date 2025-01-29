# ✅ VPC
output "vpc_id" {
  description = "ID созданной VPC"
  value       = module.vpc.vpc_id
}

# ✅ Public и Private Subnets
output "public_subnets_id" {
  description = "ID всех публичных подсетей"
  value       = module.vpc.public_subnets_id
}

output "private_subnets_id" {
  description = "ID всех приватных подсетей"
  value       = module.vpc.private_subnets_id
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

# ✅ Интернет-шлюз и NAT-шлюзы
output "internet_gateway_id" {
  description = "ID Internet Gateway"
  value       = module.vpc.internet_gateway_id
}

output "nat_gateway_a_id" {
  description = "ID NAT Gateway A"
  value       = module.vpc.nat_gateway_a_id
}

output "nat_gateway_b_id" {
  description = "ID NAT Gateway B"
  value       = module.vpc.nat_gateway_b_id
}

# ✅ Таблицы маршрутизации
output "route_table_public_a_id" {
  description = "ID публичной таблицы маршрутов A"
  value       = module.vpc.route_table_public_a_id
}

output "route_table_public_b_id" {
  description = "ID публичной таблицы маршрутов B"
  value       = module.vpc.route_table_public_b_id
}

output "route_table_private_a_id" {
  description = "ID приватной таблицы маршрутов A"
  value       = module.vpc.route_table_private_a_id
}

output "route_table_private_b_id" {
  description = "ID приватной таблицы маршрутов B"
  value       = module.vpc.route_table_private_b_id
}

# ✅ Security Group (из модуля security_group)
output "security_group_id" {
  description = "ID созданной Security Group"
  value       = module.security_group.security_group_id
}

# ✅ S3 бакет
output "s3_bucket_name" {
  description = "Имя S3 бакета"
  value       = module.s3.s3_bucket_name
}

output "s3_bucket_arn" {
  description = "ARN S3 бакета"
  value       = module.s3.s3_bucket_arn
}

output "s3_bucket_region" {
  description = "Регион S3 бакета"
  value       = module.s3.s3_bucket_region
}

output "s3_bucket_url" {
  description = "URL бакета для доступа"
  value       = module.s3.s3_bucket_url
}
