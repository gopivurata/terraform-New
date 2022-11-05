# create aws network-lb
resource "aws_lb" "n-lb" {
  name               = "n-lb"
  internal           = false
  load_balancer_type = var.lb_type
  subnets       = [aws_subnet.temp-sub.id]
  ip_address_type = var.ip_type
  enable_deletion_protection = false

  tags = {
    Environment = var.names
  }
}
