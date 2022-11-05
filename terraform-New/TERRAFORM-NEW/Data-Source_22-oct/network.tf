data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "subnetids" {
    filter {
      name = "availability-zone"
      values = [ "us-west-2b" ]
    }
}

data "aws_instances" "instance_state_names" {
  instance_state_names = ["running", "stopped"]
}

output "vpc_id" {
  value = data.aws_vpc.default.id
}

output "subnets_ids" {
    value = data.aws_subnets.subnetids.id
}

output "instance_state" {
    value = data.aws_instances.instance_state_names.id
}