resource "aws_alb" "web_alb" {
  name                       = "web-alb"
  security_groups            = ["${aws_security_group.webserver_sg.id}"]
  internal                   = false
  subnets                    = ["${values(var.public_subnets_id)}"]
  idle_timeout               = 60
  enable_deletion_protection = true

  tags {
    Name        = "web-alb"
  }
}


resource "aws_alb_listener" "web_https_alb" {
  load_balancer_arn = "${aws_alb.reno_web_alb.arn}"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:iam::${var.account_id}:server-certificate/${var.domain}-${var.env}"


  default_action {
    target_group_arn = "${aws_alb_target_group.reno_web_asg.arn}"
    type             = "forward"
  }
}

output "reno_web_https_alb_arn" {
  value = "${aws_alb_listener.reno_web_https_alb.arn}"
}

resource "aws_alb_target_group" "reno_web_asg" {
  deregistration_delay = 30
  name                 = "${var.service_name}-${var.role}-${var.env}-asg"
  port                 = 80
  protocol             = "HTTP"
  vpc_id               = "${var.vpc_id}"

  health_check {
    port                = 81
    path                = "/"
    matcher             = "200"
    timeout             = 10
    interval            = 15
    healthy_threshold   = 5
    unhealthy_threshold = 3
  }
}
