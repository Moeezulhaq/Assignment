resource "aws_lb" "Alb" {
  internal           = var.loadbalancer.internal
  load_balancer_type = var.loadbalancer.load_balancer_type
  security_groups    = var.security_group
  subnets            = var.subnets

  enable_deletion_protection = false

  tags = {
    Name = "Alb"
  }
}

# resource "aws_lb_target_group_attachment" "wordpress_01" {
#   target_group_arn = aws_lb_target_group.alb_targetgroup.arn
#   target_id        = var.public_subnetid_1
#   port             = 80
# }

# resource "aws_lb_target_group_attachment" "wordpress" {
#   target_group_arn = aws_lb_target_group.alb_targetgroup.arn
#   target_id        = var.public_subnetid
#   port             = 80
# }

resource "aws_lb_target_group" "alb_targetgroup" {
  port        = var.loadbalancer.port_alb_targetgroup
  protocol    = var.loadbalancer.protocol_alb_targetgroup
  target_type = var.loadbalancer.target_type_alb_targetgroup
  vpc_id      = var.vpc_id
    health_check {
        port = var.loadbalancer.port_alb_targetgroup
        healthy_threshold = var.loadbalancer.healthy_threshold_alb_targetgroup
        unhealthy_threshold = var.loadbalancer.unhealthy_threshold_alb_targetgroup
        timeout = var.loadbalancer.timeout_alb_targetgroup
        interval = var.loadbalancer.interval_alb_targetgroup
        matcher = var.loadbalancer.matcher_alb_targetgroup
  }

}


resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.Alb.arn
  port              = var.loadbalancer.port_https
  protocol          = var.loadbalancer.protocol_https
  ssl_policy        = var.loadbalancer.ssl_policy_https
  certificate_arn   = var.loadbalancer.certificate_arn

  default_action {
    type             = var.loadbalancer.type_https
    target_group_arn = aws_lb_target_group.alb_targetgroup.arn
  }
}

resource "aws_route53_record" "record" {
  zone_id = var.loadbalancer.zone_id
  name    = var.loadbalancer.name_record
  type    = var.loadbalancer.type_record
  alias {
    name                   = aws_lb.Alb.dns_name
    zone_id                = aws_lb.Alb.zone_id
    evaluate_target_health = var.loadbalancer.evaluate_target_health_record
  }
}