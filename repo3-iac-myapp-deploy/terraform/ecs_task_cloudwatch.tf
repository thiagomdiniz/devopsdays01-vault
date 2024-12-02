resource "aws_cloudwatch_log_group" "main" {
  name = "${var.cluster_name}/${var.service_name}/logs"
}