resource "aws_subnet" "public_subnet_1a" {
  vpc_id = aws_vpc.main.id

  cidr_block        = "10.0.48.0/24"
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "${var.project_name}-public-subnet-1a"
  }
}

resource "aws_subnet" "public_subnet_1b" {
  vpc_id = aws_vpc.main.id

  cidr_block        = "10.0.49.0/24"
  availability_zone = "${var.aws_region}b"

  tags = {
    Name = "${var.project_name}-public-subnet-1b"
  }
}

resource "aws_route_table" "public_internet_access" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}-public"
  }
}

resource "aws_route" "public_access" {
  route_table_id         = aws_route_table.public_internet_access.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}

resource "aws_route_table_association" "public_1a" {
  subnet_id      = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.public_internet_access.id
}

resource "aws_route_table_association" "public_1b" {
  subnet_id      = aws_subnet.public_subnet_1b.id
  route_table_id = aws_route_table.public_internet_access.id
}