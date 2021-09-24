data "template_file" "user_data" {
  template = file("modules/ec2/Wordpress.sh")
}

data "template_file" "user_data_sql" {
  template = file("modules/ec2/Sql.sh")
}

#======================Instance======================

# resource "aws_instance" "wordpress" {
#   instance_type = var.ec2.instance_type
#   ami           = var.ec2.ami
#   subnet_id      = var.public_subnetid
#   vpc_security_group_ids = [var.securitygroup]
#   user_data                   = data.template_file.user_data.rendered
#   key_name = "Moeezore"

#   tags = {
#     Name = "wordpress"
#   }
# }

#======================Instance======================


resource "aws_launch_configuration" "wordpress" {
  name_prefix   = "terraform-lc-wordpress-"
  image_id      = var.ec2.ami
  instance_type = var.ec2.instance_type
  key_name = var.ec2.key_name
  security_groups = [var.securitygroup]
  user_data = data.template_file.user_data.rendered  
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "wordpress_asg" {
  name                      = "wordpress_asg-terraform-test"
  max_size                  = var.ec2.max_size
  min_size                  = var.ec2.min_size
  health_check_grace_period = var.ec2.health_check_grace_period
  health_check_type         = var.ec2.health_check_type
  desired_capacity          = var.ec2.desired_capacity
  force_delete              = var.ec2.force_delete
  launch_configuration      = aws_launch_configuration.wordpress.name
  vpc_zone_identifier       = [ var.public_subnetid]
}

resource "aws_autoscaling_attachment" "wordpress_asg" {
  autoscaling_group_name = aws_autoscaling_group.wordpress_asg.id
  alb_target_group_arn   = var.alb_target_group_arn
}

#======================Instance======================

# resource "aws_instance" "wordpress_01" {
#   instance_type = var.ec2.instance_type
#   ami           = var.ec2.ami
#   subnet_id      = var.public_subnetid_1
#   vpc_security_group_ids = [var.securitygroup]
#   user_data                   = data.template_file.user_data.rendered
#   key_name = "Moeezore"

#   tags = {
#     Name = "wordpress_01"
#   }
# }  

#======================Instance======================

resource "aws_launch_configuration" "wordpress_01" {
  name_prefix   = "terraform-lc-wordpress_01-"
  image_id      = var.ec2.ami
  instance_type = var.ec2.instance_type
  key_name = var.ec2.key_name
  security_groups = [var.securitygroup]
  user_data = data.template_file.user_data.rendered  
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "wordpress_01_asg" {
  name                      = "wordpress_01_asg-terraform-test"
  max_size                  = var.ec2.max_size
  min_size                  = var.ec2.min_size
  health_check_grace_period = var.ec2.health_check_grace_period
  health_check_type         = var.ec2.health_check_type
  desired_capacity          = var.ec2.desired_capacity
  force_delete              = var.ec2.force_delete
  launch_configuration      = aws_launch_configuration.wordpress.name
  vpc_zone_identifier       = [ var.public_subnetid_1]
}

resource "aws_autoscaling_attachment" "wordpress_01" {
  autoscaling_group_name = aws_autoscaling_group.wordpress_01_asg.id
  alb_target_group_arn   = var.alb_target_group_arn
}

# resource "aws_instance" "sqldatabase" {
#   instance_type = var.ec2.instance_type
#   ami           = var.ec2.ami
#   subnet_id      = var.private_subnetid
#   vpc_security_group_ids = [var.securitygroup]
#   user_data                   = data.template_file.user_data_sql.rendered
#   key_name = "Moeezore"

#   tags = {
#     Name = "sqldatabase"
#   }
# }
resource "aws_launch_configuration" "sqldatabase" {
  name_prefix   = "terraform-lc-sqldatabase-"
  image_id      = var.ec2.ami
  instance_type = var.ec2.instance_type
  key_name = var.ec2.key_name
  security_groups = [var.security_group_db]
  user_data = data.template_file.user_data_sql.rendered
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "sqldatabase_asg" {
  name                      = "sqldatabase_asg-terraform-test"
  max_size                  = var.ec2.max_size
  min_size                  = var.ec2.min_size
  health_check_grace_period = var.ec2.health_check_grace_period
  health_check_type         = var.ec2.health_check_type
  desired_capacity          = var.ec2.desired_capacity
  force_delete              = var.ec2.force_delete
  launch_configuration      = aws_launch_configuration.sqldatabase.name
  vpc_zone_identifier       = [ var.private_subnetid]
}

