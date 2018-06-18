############################
# Target Groups
############################
resource "aws_lb_target_group" "target_group" {
  name                  = "tg-${var.project_name}-${var.environment}"
  port                  = 8080
  protocol              = "HTTP"
  vpc_id                = "${var.vpc_id}"
  deregistration_delay  = 60

  health_check {
    interval            = 20
    path                = "/"
    port                = 8080
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = 15
    healthy_threshold   = 2
    unhealthy_threshold = 3
  }
}
