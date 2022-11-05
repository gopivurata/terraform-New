# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "Myvpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.my_vpc.id
  count = length(var.subnet_cidrs)
  cidr_block = var.subnet_cidrs[count.index]
  availability_zone = var.subnet_azs[count.index]

  tags = {
    Name = var.subnet_name_tags[count.index]
  }
}