resource "aws_lb_target_group" "tg_main" {
    name     = var.target_group_name
    port     = var.target_group_port
    protocol = var.target_group_protocol
    vpc_id   = var.target_group_vpc_id
    health_check {
        port = var.helth_check_port
        protocol = var.helth_check_protocol
        path = "/"
    }
    tags = var.target_group_tags
  }

resource "aws_lb_listener" "listener_main" {
    load_balancer_arn = aws_lb.alb_main.arn
    port              = var.listener_port
    protocol          = var.listener_protocol
    default_action {
      type             = "forward"
      target_group_arn = aws_lb_target_group.tg_main.arn
    }
 }

 resource "aws_lb" "alb_main" {
     name        = var.alb_name
     internal      = false
     load_balancer_type  = "application"
     subnets = var.alb_subnets
     security_groups = var.alb_security_groups
     enable_deletion_protection = false
     tags =  var.tags
}
