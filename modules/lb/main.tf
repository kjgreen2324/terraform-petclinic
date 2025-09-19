#---------------------------------------ALB-----------------------------------
resource "aws_lb" "tf_alb" {
  name               = "tf-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_alb_id]
  subnets            = [var.pub_a_sub_id,var.pub_c_sub_id]
  tags = {
    Environment = "tf-alb"
    Name        = "tf-alb"
  }
}

resource "aws_lb_target_group" "tf_alb_tg" {
  name_prefix = "tf-alb"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
  lifecycle {
    create_before_destroy = true
  }
}

/*
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.tf_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = var.certificate_arn
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tf_alb_tg.arn
  }
}

resource "aws_lb_listener_rule" "https" {
  listener_arn = aws_lb_listener.https
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tf_alb_tg.arn
  }

  condition {
    path_pattern {
      values = ["*"]
    }
  }

}
 */
#---------------------------------------NLB-----------------------------------

resource "aws_lb" "tf_nlb" {
  name               = "tf-nlb"
  internal           = true
  load_balancer_type = "network"
  security_groups    = [var.sg_nlb_id]
  subnets            = [var.pri02_a_sub_id,var.pri02_c_sub_id]
  tags = {
    Environment = "tf-nlb"
    Name        = "tf-nlb"
  }
}

resource "aws_lb_target_group" "tf_nlb_tg_was" {
  name_prefix = "tf-nlb"
  port        = "8080"
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  health_check {
    protocol            = "TCP"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_lb_listener" "back_end_was" {
  load_balancer_arn = aws_lb.tf_nlb.arn
  port              = "80"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tf_nlb_tg_was.arn
  }
}

