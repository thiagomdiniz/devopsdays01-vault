resource "aws_ecs_service" "vault" {
  name            = "${var.project_name}-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.vault.arn
  desired_count   = 1

  launch_type = "FARGATE"

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  network_configuration {
    subnets = [
      aws_subnet.private_subnet_1a.id,
      aws_subnet.private_subnet_1b.id
    ]
    security_groups  = [aws_security_group.vault.id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.vault.arn
    container_name   = "vault"
    container_port   = 8200
  }

  lifecycle {
    ignore_changes = [
      desired_count
    ]
  }

}