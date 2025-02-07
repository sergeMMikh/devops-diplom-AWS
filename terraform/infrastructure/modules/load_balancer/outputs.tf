output "load_balancer_arn" {
  description = "ARN (Amazon Resource Name) созданного Load Balancer"
  value       = aws_lb.ingress_alb.arn
}

output "load_balancer_dns_name" {
  description = "DNS-имя Load Balancer'а"
  value       = aws_lb.ingress_alb.dns_name
}

output "load_balancer_security_group_id" {
  description = "ID Security Group для Load Balancer"
  value       = aws_security_group.ingress_alb_sg.id
}

output "target_group_arn" {
  description = "ARN целевой группы для Load Balancer"
  value       = aws_lb_target_group.ingress_tg.arn
}
