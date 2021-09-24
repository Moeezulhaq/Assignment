output "outputs" {
  value = {
  vpc_id = aws_vpc.moeez_vpc.id
  

  public_sub  =  aws_subnet.public_subnet[0].id
  
  private_sub =  aws_subnet.private_subnet[0].id
  
  public_sub_1  =  aws_subnet.public_subnet[2].id

  public_subnet_alb = aws_subnet.public_subnet[3].id
    
  public_subnet_alb1 = aws_subnet.public_subnet[4].id

  public_subnet_alb2 = aws_subnet.public_subnet[5].id

  public_subnet_alb3 = aws_subnet.public_subnet[6].id

  alb_1 =  aws_subnet.public_subnet[0]
  
  alb = aws_subnet.public_subnet[2]

  }  
}
