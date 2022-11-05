# Create a VPC
resource "aws_vpc" "my_vpc1" {
  cidr_block = "10.10.0.0/16"
  provider = aws.first
}

resource "aws_vpc" "my_vpc2" {
  cidr_block = "10.10.0.0/16"
  provider = aws.second
}

output "first_vpc_id" {
  value = aws_vpc.my_vpc1.id
}

output "second_vpc_id" {
  value = aws_vpc.my_vpc2.id
}