# Create a new load balancer attachment
resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.my_asg.id
  lb_target_group_arn    = aws_lb_target_group.lb-tg.arn
}