output "security_group_id" {
  value = {
  sg_id = aws_security_group.security_group.id
  alb_sg_id = aws_security_group.security_group_alb.id
  db_sg_id = aws_security_group.security_group_db.id
  }
}