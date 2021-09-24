output "outputs_ec2" {
  value = {
    wordpress_id = aws_launch_configuration.wordpress.id

    wordpress_01_id = aws_launch_configuration.wordpress_01.arn

  }  
}
