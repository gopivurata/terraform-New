# creating security group
resource "aws_security_group" "temp_sec" {
  name        = "allow_tcp"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.temp_vpc.id

  ingress {
    description      = "TCP from VPC"
    from_port        = var.port[0]
    to_port          = var.port[0]
    protocol         = var.protocol[0]
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "TCP from VPC"
    from_port        = var.port[1]
    to_port          = var.port[1]
    protocol         = var.protocol[1]
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = var.port[2]
    to_port          = var.port[2]
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}