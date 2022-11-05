# creating db subnet groups
resource "aws_db_subnet_group" "mysql" {
  name       = "db_subnets"
  subnet_ids = [
    module.vpc.private_subnets[local.db_subnet1],
    module.vpc.private_subnets[local.db_subnet2] ]
    depends_on = [
      module.vpc
    ]

  tags = {
    Name = "My DB subnet group"
  }
}


# creating db
resource "aws_db_instance" "default" {
  allocated_storage      = 20
  db_name                = "mydb"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  username               = "root"
  password               = "rootroot"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.mysql.name
  vpc_security_group_ids = [aws_security_group.allow_tcp.id]
  depends_on = [
    aws_db_subnet_group.mysql
  ]
}