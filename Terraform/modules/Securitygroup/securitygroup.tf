resource "aws_security_group" "security_group" {
  vpc_id      = var.aws_vpc_id
  name        = "allow-ssh"
  description = "security group that allows ssh and all egress traffic"
  egress {
    from_port   = var.security_group.from_port
    to_port     = var.security_group.to_port
    protocol    = var.security_group.protocol
    cidr_blocks = var.security_group.cidr_blocks
  }

  ingress {
    from_port   = var.security_group.from_port_http
    to_port     = var.security_group.to_port_http
    protocol    = var.security_group.protocol_tcp
    security_groups = [aws_security_group.security_group_alb.id]
  }

  ingress {
    from_port   = var.security_group.from_port_https
    to_port     = var.security_group.to_port_https
    protocol    = var.security_group.protocol_tcp
    security_groups = [aws_security_group.security_group_alb.id]
  }
  ingress {
    from_port   = var.security_group.from_port_mysql
    to_port     = var.security_group.to_port_mysql
    protocol    = var.security_group.protocol_tcp
    security_groups = [aws_security_group.security_group_alb.id]
  }
  ingress {
    from_port   = var.security_group.from_port_ssh
    to_port     = var.security_group.to_port_ssh
    protocol    = var.security_group.protocol_tcp
    cidr_blocks = var.security_group.cidr_blocks
  }
  ingress {
    from_port   = var.security_group.from_port_http
    to_port     = var.security_group.to_port_http
    protocol    = var.security_group.protocol_tcp
    cidr_blocks = var.security_group.cidr_blocks
  }
  tags = {
    Name = "moeez_sg"
  }
}

resource "aws_security_group" "security_group_alb" {
  vpc_id      = var.aws_vpc_id
  name        = "allow-ssh-loadbalancer"
  description = "security group for loadbalancer"
  egress {
    from_port   = var.security_group.from_port
    to_port     = var.security_group.to_port
    protocol    = var.security_group.protocol
    cidr_blocks = var.security_group.cidr_blocks
  }

  ingress {
    from_port   = var.security_group.from_port_http
    to_port     = var.security_group.to_port_http
    protocol    = var.security_group.protocol_tcp
    cidr_blocks = var.security_group.cidr_blocks
  }

  ingress {
    from_port   = var.security_group.from_port_https
    to_port     = var.security_group.to_port_https
    protocol    = var.security_group.protocol_tcp
    cidr_blocks = var.security_group.cidr_blocks
  }
  tags = {
    Name = "moeez_sg_alb"
  }
}

resource "aws_security_group" "security_group_db" {
  vpc_id      = var.aws_vpc_id
  name        = "allow-ssh-db"
  description = "security group for db"
  egress {
    from_port   = var.security_group.from_port
    to_port     = var.security_group.to_port
    protocol    = var.security_group.protocol
    cidr_blocks = var.security_group.cidr_blocks
  }

  ingress {
    from_port   = var.security_group.from_port_http
    to_port     = var.security_group.to_port_http
    protocol    = var.security_group.protocol_tcp
    security_groups = [aws_security_group.security_group.id]
  }

  ingress {
    from_port   = var.security_group.from_port_https
    to_port     = var.security_group.to_port_https
    protocol    = var.security_group.protocol_tcp
    security_groups = [aws_security_group.security_group.id]
  }
  ingress {
    from_port   = var.security_group.from_port_mysql
    to_port     = var.security_group.to_port_mysql
    protocol    = var.security_group.protocol_tcp
    security_groups = [aws_security_group.security_group.id]
  }
    ingress {
    from_port   = var.security_group.from_port_ssh
    to_port     = var.security_group.to_port_ssh
    protocol    = var.security_group.protocol_tcp
    security_groups = [aws_security_group.security_group.id]
  }
  tags = {
    Name = "moeez_sg_db"
  }
}