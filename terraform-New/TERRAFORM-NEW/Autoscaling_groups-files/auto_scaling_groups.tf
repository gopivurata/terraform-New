# creating auto scaling groups

resource "aws_autoscaling_group" "my_asg" {
  name = var.names
  availability_zones = [var.az]
  desired_capacity   = var.desired
  max_size           = var.max
  min_size           = var.min
  health_check_grace_period = var.health_check_period
  health_check_type = var.health_check_type


  launch_template {
    id      = aws_launch_template.my-template.id
    version = "$Latest"
  }
}