# output "instance_profile_name" {
#   value = aws_iam_instance_profile.ec2_instance_profile.name
# }


output "master_node_public_ip" {
  description = "Публичный IP мастер-ноды"
  value       = aws_instance.master_node.public_ip
}

output "master_node_private_ip" {
  description = "Приватный IP мастер-ноды"
  value       = aws_instance.master_node.private_ip
}

output "worker_nodes_public_ips" {
  description = "Публичные IP worker-нод"
  value       = aws_instance.worker_nodes[*].public_ip
}

output "worker_nodes_private_ips" {
  description = "Приватные IP worker-нод"
  value       = aws_instance.worker_nodes[*].private_ip
}

output "master_node_id" {
  description = "ID мастер-ноды"
  value       = aws_instance.master_node.public_ip
}

output "worker_nodes_ids" {
  description = "Публичные IP worker-нод"
  value       = aws_instance.worker_nodes[*].id
}
