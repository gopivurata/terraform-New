# creating aws lb listener

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.n-lb.arn
  port              = var.port[1]
  protocol          = var.protocol[1]

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb-tg.arn
  }
}