
# provider
provider "aws" {
  region     = "us-west-2"
}

# creating VPC
resource "aws_vpc" "temp_vpc" {
  cidr_block       = "192.168.0.0/16"

  tags = {
    Name = "tempvpc"
  }
}

# creating subnet
resource "aws_subnet" "temp-sub" {
  vpc_id     = aws_vpc.temp_vpc.id
  cidr_block = "192.168.0.0/24"
   availability_zone = "us-west-2a"

  tags = {
    Name = "tempsub"
  }
}

# creating aws_internet_gateway
resource "aws_internet_gateway" "temp-igw" {
  vpc_id = aws_vpc.temp_vpc.id

  tags = {
    Name = "tempigw"
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

# creating security group
resource "aws_security_group" "temp_tcp" {
  name        = "allow_tcp"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.temp_vpc.id

  ingress {
    description      = "TCP from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "TCP from VPC"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tcp"
  }
}

resource "aws_key_pair" "ssh_key" {
   key_name = "key"
   public_key = file("C:/Users/gopiv/.ssh/id_rsa.pub")
  
}

resource "aws_instance" "my_instance" {
  ami                         = "ami-0c09c7eb16d3e8e70"
  associate_public_ip_address = "true"
  availability_zone           = "us-west-2a"
  instance_type               = "t2.micro"
  key_name                    = "key"
  security_groups             = [ "${aws_security_group.temp_tcp.id}" ]
  subnet_id                   = aws_subnet.temp-sub.id
  tags = {
    Name = "myinstance"
  }

}