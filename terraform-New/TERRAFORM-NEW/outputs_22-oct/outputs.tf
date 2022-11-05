#value = type of resource.name of resource.attribute
output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "subnets_id" {
  value = aws_subnet.main[*].id
}

output "subnet_name_tags" {
  value = aws_subnet.main[*].tags_all
}
