resource "aws_security_group" "allow_tcp" {
  name        = "allow_tcp"
  description = "Allow tcp inbound traffic"
  vpc_id      = module.vpc.vpc_id
  depends_on = [
      module.vpc
    ]

  ingress {
    description      = "TLS from VPC"
    from_port        = local.msql_port
    to_port          = local.msql_port
    protocol         = local.tcp
    cidr_blocks      = [local.anywhere]
  }

  tags = {
    Name = "msql"
  }
}