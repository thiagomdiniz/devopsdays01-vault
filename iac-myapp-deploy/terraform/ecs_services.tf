resource "aws_ecs_service" "main" {
  name            = "${var.service_name}-service"
  cluster         = var.cluster_name
  task_definition = aws_ecs_task_definition.main.arn
  desired_count   = var.service_task_count

  launch_type = "FARGATE"

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  network_configuration {
    subnets = [
      data.aws_ssm_parameter.private_subnet_1.value,
      data.aws_ssm_parameter.private_subnet_2.value,
    ]
    security_groups  = [
        aws_security_group.lb.id,
        aws_security_group.efs.id,
      ]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.main.arn
    container_name   = var.service_name
    container_port   = var.service_port
  }

  lifecycle {
    ignore_changes = [
      desired_count
    ]
  }

}