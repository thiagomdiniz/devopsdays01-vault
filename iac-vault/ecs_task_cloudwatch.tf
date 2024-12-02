resource "aws_cloudwatch_log_group" "vault" {
  name = "${var.project_name}/vault/logs"
}