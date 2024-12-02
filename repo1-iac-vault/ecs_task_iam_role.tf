resource "aws_iam_role" "ecs_task_vault_role" {
  name = "${var.project_name}-ecs-task-vault-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "ecs_task_vault_role_policy" {
  name       = "${var.project_name}-ecs_task_vault_role_policy"
  roles      = [aws_iam_role.ecs_task_vault_role.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}