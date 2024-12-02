resource "aws_subnet" "private_subnet_1a" {
  vpc_id = aws_vpc.main.id

  cidr_block        = "10.0.0.0/20"
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "${var.project_name}-private-subnet-1a"
  }
}

resource "aws_subnet" "private_subnet_1b" {
  vpc_id = aws_vpc.main.id

  cidr_block        = "10.0.16.0/20"
  availability_zone = "${var.aws_region}b"

  tags = {
    Name = "${var.project_name}-private-subnet-1b"
  }
}

resource "aws_route_table" "private_internet_access_1a" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}-private-1a"
  }
}

resource "aws_route" "private_access_1a" {
  route_table_id         = aws_route_table.private_internet_access_1a.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.nat_1a.id
}

resource "aws_route_table" "private_internet_access_1b" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}-private-1b"
  }
}

resource "aws_route" "private_access_1b" {
  route_table_id         = aws_route_table.private_internet_access_1b.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.nat_1b.id
}

resource "aws_route_table_association" "private_1a" {
  subnet_id      = aws_subnet.private_subnet_1a.id
  route_table_id = aws_route_table.private_internet_access_1a.id
}

resource "aws_route_table_association" "private_1b" {
  subnet_id      = aws_subnet.private_subnet_1b.id
  route_table_id = aws_route_table.private_internet_access_1b.id
}