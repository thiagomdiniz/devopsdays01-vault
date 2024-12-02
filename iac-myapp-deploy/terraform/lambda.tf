# resource "aws_lambda_function" "lambda" {
#   function_name = "vault-myapp"
#   runtime       = "python3.12"
#   handler       = "function.lambda_handler"
#   role          = aws_iam_role.lambda_exec.arn

#   filename      = "lambda.zip"

#   file_system_config {
#     arn            = aws_efs_access_point.lambda.arn
#     local_mount_path = "/mnt/vault"
#   }

#   environment {
#     variables = {
#       EFS_PATH = "/mnt/vault"
#     }
#   }

#   depends_on = [aws_efs_mount_target.mount_1a]
# }


# resource "aws_iam_role" "lambda_exec" {
#   name = "lambda-efs-role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Action    = "sts:AssumeRole",
#         Effect    = "Allow",
#         Principal = {
#           Service = "lambda.amazonaws.com"
#         }
#       }
#     ]
#   })
# }

# resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
#   role       = aws_iam_role.lambda_exec.name
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
# }

# resource "aws_iam_role_policy_attachment" "efs_access" {
#   role       = aws_iam_role.lambda_exec.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonElasticFileSystemClientReadWriteAccess"
# }
