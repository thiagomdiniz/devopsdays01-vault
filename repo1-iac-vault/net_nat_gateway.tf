resource "aws_eip" "vpc_eip_1a" {
  domain = "vpc"

  tags = {
    Name = "${var.project_name}-eip-1a"
  }
}

resource "aws_nat_gateway" "nat_1a" {
  allocation_id = aws_eip.vpc_eip_1a.id
  subnet_id     = aws_subnet.public_subnet_1a.id

  tags = {
    Name = "${var.project_name}-nat-1a"
  }
}

resource "aws_eip" "vpc_eip_1b" {
  domain = "vpc"

  tags = {
    Name = "${var.project_name}-eip-1b"
  }
}

resource "aws_nat_gateway" "nat_1b" {
  allocation_id = aws_eip.vpc_eip_1b.id
  subnet_id     = aws_subnet.public_subnet_1b.id

  tags = {
    Name = "${var.project_name}-nat-1b"
  }
}