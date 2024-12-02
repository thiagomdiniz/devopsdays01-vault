resource "aws_alb_target_group" "vault" {
  name = substr("${var.project_name}-tg", 0, 32)

  port   = 8200
  vpc_id = aws_vpc.main.id

  protocol    = "HTTP"
  target_type = "ip"

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 5
    timeout             = 5
    interval            = 10
    matcher             = 200
    path                = "/v1/sys/health"
    port                = 8200
  }

  lifecycle {
    create_before_destroy = false
  }
}