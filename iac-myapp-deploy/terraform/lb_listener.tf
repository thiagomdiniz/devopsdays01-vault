resource "aws_lb_listener" "main" {
  load_balancer_arn = data.aws_ssm_parameter.alb.value
  port              = var.lb_listener_port
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.main.arn
  }
}