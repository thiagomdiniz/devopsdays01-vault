region = "us-east-1"

cluster_name = "devopsdays-vault"

service_name = "myapp"

service_port = 8080

service_cpu = 256

service_memory = 512

service_task_count = 1

lb_listener_port = 80

ssm_vpc_id = "/devopsdays-vault/vpc/vpc_id"

ssm_private_subnet_1 = "/devopsdays-vault/vpc/subnet_private_1a"

ssm_private_subnet_2 = "/devopsdays-vault/vpc/subnet_private_1b"

ssm_alb = "/devopsdays-vault/ecs/lb/arn"