# resource "aws_alb_listener_rule" "vault" {
#   listener_arn = aws_lb_listener.main.arn

#   action {
#     type             = "forward"
#     target_group_arn = aws_alb_target_group.vault.arn
#   }

#   condition {
#     host_header {
#       values = ["vault.devopsdays"]
#     }
#   }

# }

# resource "aws_lb_listener" "https_listener" {
#   load_balancer_arn = aws_lb.main.arn
#   port              = 443
#   protocol          = "HTTPS"

#   ssl_policy        = "ELBSecurityPolicy-2016-08"
#   certificate_arn   = aws_acm_certificate.lb_certificate.arn

#   default_action {
#     type = "forward"
#     target_group_arn = aws_alb_target_group.vault.arn
#   }
# }