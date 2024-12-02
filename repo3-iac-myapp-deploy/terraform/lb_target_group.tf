resource "aws_alb_target_group" "main" {
  name = substr("${var.service_name}-tg", 0, 32)

  port   = var.service_port
  vpc_id = data.aws_ssm_parameter.vpc_id.value

  protocol    = "HTTP"
  target_type = "ip"

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 6
    timeout             = 5
    interval            = 10
    matcher             = 200
    path                = "/health"
    port                = var.service_port
  }

  lifecycle {
    create_before_destroy = false
  }
}