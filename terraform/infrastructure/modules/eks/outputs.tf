# ✅ Security Group ID (используется для EKS)
output "security_group_id" {
  description = "ID созданной Security Group для EKS"
  value       = module.eks.cluster_security_group_id
}

# # ✅ Список worker-нод в EKS (Instance IDs)
# output "eks_worker_nodes" {
#   description = "Worker Nodes EKS (список инстансов в AutoScaling)"
#   value       = module.eks.eks_managed_node_groups["eks_nodes"].resources
# }


# ✅ Список публичных IP worker-нод
output "eks_worker_nodes_public_ips" {
  description = "Публичные IP worker-нод"
  value       = data.aws_instances.eks_worker_nodes.public_ips
}

# ✅ Список приватных IP worker-нод
output "eks_worker_nodes_private_ips" {
  description = "Приватные IP worker-нод"
  value       = data.aws_instances.eks_worker_nodes.private_ips
}