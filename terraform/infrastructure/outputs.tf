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

# ✅ Security Group (EKS)
output "security_group_id" {
  description = "ID Security Group для EKS"
  value       = module.eks.security_group_id
}

# ✅ Публичные IP worker-нод
output "eks_worker_nodes_public_ips" {
  description = "Публичные IP worker-нод"
  value       = module.eks.eks_worker_nodes_public_ips
}

# ✅ Приватные IP worker-нод
output "eks_worker_nodes_private_ips" {
  description = "Приватные IP worker-нод"
  value       = module.eks.eks_worker_nodes_private_ips
}

# # ✅ Получение списка worker-нод
# output "eks_worker_nodes" {
#   description = "Worker Nodes EKS (список инстансов в AutoScaling)"
#   value       = module.eks.eks_worker_nodes
# }


# # ✅ Security Group (из модуля security_group)
# output "security_group_id" {
#   description = "ID созданной Security Group"
#   value       = module.security_group.security_group_id
# }

# output "master_node_public_ip" {
#   description = "Публичный IP мастер-ноды"
#   value       = module.ec2.master_node_public_ip
# }

# output "master_node_private_ip" {
#   description = "Приватный IP мастер-ноды"
#   value       = module.ec2.master_node_private_ip
# }

# output "worker_nodes_public_ips" {
#   description = "Публичные IP worker-нод"
#   value       = module.ec2.worker_nodes_public_ips
# }

# output "worker_nodes_private_ips" {
#   description = "Приватные IP worker-нод"
#   value       = module.ec2.worker_nodes_private_ips
# }

# output "master_node_id" {
#   description = "ID мастер-ноды"
#   value       = module.ec2.master_node_id
# }

# output "worker_nodes_ids" {
#   description = "Публичные IP worker-нод"
#   value       = module.ec2.worker_nodes_ids
# }
