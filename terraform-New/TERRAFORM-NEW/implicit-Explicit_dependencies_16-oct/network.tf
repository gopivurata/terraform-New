# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "myvpc"
  }
}

# Create a subnets

resource "aws_subnet" "my_subnet1" {  # implicit dependecy
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.10.0.0/24"

  tags = {
    Name = "Mysubnet"
  }
  depends_on = [        #explicit dependency
    aws_vpc.my_vpc
  ]
}

resource "aws_subnet" "my_subnet2" {
  vpc_id     = aws_vpc.my_vpc.id    # implicit dependecy
  cidr_block = "10.10.1.0/24"

  tags = {
    Name = "Mysubnet2"
  }
  depends_on = [                  #explicit dependency
    aws_subnet.my_subnet1
  ]
}

resource "aws_subnet" "my_subnet3" {
  vpc_id     = aws_vpc.my_vpc.id       # implicit dependecy
  cidr_block = "10.10.2.0/24"

  tags = {
    Name = "Mysubnet3"
  }
  depends_on = [                      #explicit dependency
    aws_subnet.my_subnet2
  ]
}


