# resource "aws_security_group" "lb" {
#   name   = "${var.project_name}-load-balancer"
#   vpc_id = aws_vpc.main.id

#   egress {
#     from_port = 0
#     to_port   = 0
#     protocol  = "-1"
#     cidr_blocks = [
#       "0.0.0.0/0"
#     ]
#   }
# }

# resource "aws_security_group_rule" "ingress_80" {
#   cidr_blocks = [
#     "0.0.0.0/0"
#   ]
#   from_port         = 80
#   to_port           = 80
#   description       = "Liberando trafego na porta 80"
#   protocol          = "tcp"
#   security_group_id = aws_security_group.lb.id
#   type              = "ingress"
# }

# resource "aws_security_group_rule" "ingress_8200" {
#   cidr_blocks = [
#     "0.0.0.0/0"
#   ]
#   from_port         = 8200
#   to_port           = 8200
#   description       = "Liberando trafego na porta 8200"
#   protocol          = "tcp"
#   security_group_id = aws_security_group.lb.id
#   type              = "ingress"
# }

resource "aws_security_group" "vault" {
  name        = "${var.project_name}-lb-sg"
  description = "Allow HTTP access to Vault"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 8200
    to_port     = 8200
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "apps" {
  name        = "${var.project_name}-lb-apps-sg"
  description = "Allow HTTP access to Apps"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}