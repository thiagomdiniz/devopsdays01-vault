resource "aws_efs_file_system" "main" {
  creation_token   = "${var.service_name}-efs"
  performance_mode = "generalPurpose"
}

resource "aws_efs_mount_target" "mount_1a" {
  file_system_id = aws_efs_file_system.main.id
  subnet_id      = data.aws_ssm_parameter.private_subnet_1.value
  security_groups = [
    aws_security_group.efs.id
  ]
}

resource "aws_efs_mount_target" "mount_1b" {
  file_system_id = aws_efs_file_system.main.id
  subnet_id      = data.aws_ssm_parameter.private_subnet_2.value
  security_groups = [
    aws_security_group.efs.id
  ]
}

# resource "aws_efs_access_point" "lambda" {
#   file_system_id = aws_efs_file_system.main.id

#   posix_user {
#     uid = 1000
#     gid = 1000
#   }

#   root_directory {
#     path = "/lambda"
#     creation_info {
#       owner_gid = 1000
#       owner_uid = 1000
#       permissions = "0777"
#     }
#   }
# }