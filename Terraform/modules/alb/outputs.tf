output "outputs_alb" {
  value = {
    alb_target_group_arn   = aws_lb_target_group.alb_targetgroup.arn

  }  
}