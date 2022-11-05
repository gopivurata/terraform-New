
# creating VPC
resource "aws_vpc" "temp_vpc" {
  cidr_block       = var.vpc_cidr

  tags = {
    Name = var.names
  }
}

# creating subnet
resource "aws_subnet" "temp-sub" {
  vpc_id     = aws_vpc.temp_vpc.id
  cidr_block = var.subnet_cidr
   availability_zone = var.az

  tags = {
    Name = var.names
  }
}

# creating aws_internet_gateway
resource "aws_internet_gateway" "temp-igw" {
  vpc_id = aws_vpc.temp_vpc.id

  tags = {
    Name = var.names
  }
}

# internet_gateway attached to vpc
resource "aws_internet_gateway_attachment" "vpc_attach" {
  internet_gateway_id = aws_internet_gateway.temp-igw.id
  vpc_id              = aws_vpc.temp_vpc.id
}

# creating route table
resource "aws_route_table" "temp_rt" {
  vpc_id = aws_vpc.temp_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.temp-igw.id
  }
}

# route_table_association with subnet
resource "aws_route_table_association" "assciation" {
  subnet_id      = aws_subnet.temp-sub.id
  route_table_id = aws_route_table.temp_rt.id
}
