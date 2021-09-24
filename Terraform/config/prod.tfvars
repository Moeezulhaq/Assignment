vpc = {
    cidr = "10.0.0.0/16"
    public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24","10.0.104.0/24", "10.0.105.0/24", "10.0.106.0/24","10.0.107.0/24"]
    private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24","10.0.4.0/24"]
    
    }    


ec2 = {
    aws_region = "us-west-2"
    instance_type          = "t2.micro"
    ami = "ami-090717c950a5c34d3"
    max_size                  = "5"
    min_size                  = "1"
    health_check_grace_period = "300"
    health_check_type         = "EC2"
    desired_capacity          = "1"
    force_delete              = "false"
    key_name = "Moeezore"
    }

loadbalancer = {
    certificate_arn = "arn:aws:acm:us-west-2:489994096722:certificate/d05d9767-a428-486c-9089-2bfb0fa5191b"
    zone_id= "Z074130239BXW7W2J0TY9"
    internal           = false
    load_balancer_type = "application"
    enable_deletion_protection = false
    port_alb_targetgroup        = "80"
    protocol_alb_targetgroup    = "HTTP"
    target_type_alb_targetgroup = "instance"
    port_alb_targetgroup = "80"
    healthy_threshold_alb_targetgroup = "2"
    unhealthy_threshold_alb_targetgroup = "6"
    timeout_alb_targetgroup = "5"
    interval_alb_targetgroup = "6"
    matcher_alb_targetgroup = "200-302"  
    port_https              = "443"
    protocol_https          = "HTTPS"
    ssl_policy_https        = "ELBSecurityPolicy-2016-08"
    type_https             = "forward"
    name_record    = "test.groveops.net"
    type_record    = "A"
    evaluate_target_health_record = true
    }

security_group = {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    protocol_tcp    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port_https   = "443"
    to_port_https     = "443"
    from_port_http   = "80"
    to_port_http     = "80"
    from_port_mysql   = "3306"
    to_port_mysql     = "3306"
    from_port_ssh   = "22"
    to_port_ssh     = "22"
    }
