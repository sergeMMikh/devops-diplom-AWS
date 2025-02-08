resource "aws_lb" "ingress_alb" {
  name                       = "eks-ingress-alb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.ingress_alb_sg.id]
  subnets                    = var.subnet_ids
  enable_deletion_protection = false
}

resource "aws_lb_target_group" "ingress_tg" {
  name     = "eks-ingress-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  #   target_type = "instance"
  target_type = "id"

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 2
    matcher             = "200"
  }
}

resource "aws_security_group" "ingress_alb_sg" {
  name        = "eks-ingress-alb-sg"
  description = "Security group for ALB"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
