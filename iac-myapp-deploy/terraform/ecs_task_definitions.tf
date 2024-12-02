resource "aws_ecs_task_definition" "main" {
  family                   = "${var.service_name}-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.service_cpu
  memory                   = var.service_memory
  execution_role_arn       = aws_iam_role.main.arn
  task_role_arn       = aws_iam_role.main.arn

  volume {
    name = "conf"

    efs_volume_configuration {
      file_system_id = aws_efs_file_system.main.id
      root_directory = "/"
      transit_encryption = "ENABLED"
    }
  }

  container_definitions = jsonencode([
    {
      name      = var.service_name
      image     = var.container_image
      essential = true
      portMappings = [
        {
          containerPort = var.service_port
          hostPort      = var.service_port
          protocol      = "tcp"
        }
      ]

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = aws_cloudwatch_log_group.main.id
          awslogs-region        = var.region
          awslogs-stream-prefix = var.service_name
        }
      }

      mountPoints = [
        {
          sourceVolume = "conf"
          containerPath = "/mnt/efs"
          readOnly = false
        }
      ]

      environment = [
        {
          name  = "VAULT_DEV_ROOT_TOKEN_ID"
          value = ""
        },
      ]

      # secrets = [
      #   {
      #     name = "test_var"
      #     valueFrom = aws_ssm_parameter.lb_dns.arn
      #   },
      # ]

    }
  ])
}