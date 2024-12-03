resource "aws_lb" "main" {
  name               = "${var.project_name}-ingress"
  internal           = var.load_balancer_internal
  load_balancer_type = var.load_balancer_type

  subnets = [
    aws_subnet.public_subnet_1a.id,
    aws_subnet.public_subnet_1b.id,
  ]

  security_groups = [
    aws_security_group.vault.id,
    aws_security_group.apps.id,
  ]

  enable_cross_zone_load_balancing = false
  enable_deletion_protection       = false
}

resource "aws_lb_listener" "vault" {
  load_balancer_arn = aws_lb.main.arn
  port              = "8200"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.vault.arn
  }
}