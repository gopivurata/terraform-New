# Instance Target Group
resource "aws_lb_target_group" "lb-tg" {
  name     = var.names
  port     = var.port[1]
  protocol = var.protocol[1]
  target_type = var.target_type
  ip_address_type = var.ip_type
  vpc_id   = aws_vpc.temp_vpc.id
  
  health_check {
    protocol = var.protocol[1]
    port = var.port[1]
    healthy_threshold = var.healthy_threshold
    interval = var.interval

  }
}