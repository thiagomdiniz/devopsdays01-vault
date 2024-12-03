resource "aws_ecs_task_definition" "vault" {
  family                   = "${var.project_name}-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_vault_role.arn

  container_definitions = jsonencode([
    {
      name      = "vault"
      image     = var.hashicorp_vault_container_image
      essential = true
      portMappings = [
        {
          containerPort = 8200
          hostPort      = 8200
          protocol      = "tcp"
        }
      ]

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = aws_cloudwatch_log_group.vault.id
          awslogs-region        = var.aws_region
          awslogs-stream-prefix = "vault"
        }
      }

      environment = [
        {
          name  = "VAULT_DEV_ROOT_TOKEN_ID"
          value = var.hashicorp_dev_root_token
        },
      ]

      #!works only with EC2 launch type!
      # linuxParameters = {
      #   capabilities = {
      #     add = ["IPC_LOCK"] # Adds IPC_LOCK
      #   }
      # }
    }
  ])
}