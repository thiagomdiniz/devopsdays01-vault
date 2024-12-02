resource "aws_s3_bucket" "secret" {
  bucket = "${var.service_name}-secret"
}