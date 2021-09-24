module "vpc" {
source = "./modules/vpc"
vpc = var.vpc
}

module "moeez_sg" {
source = "./modules/Securitygroup"
aws_vpc_id = module.vpc.outputs.vpc_id
security_group= var.security_group
}
#======================Instance======================

# module "ec2" {
# source = "./modules/ec2"
# ec2= var.ec2
# public_subnetid = module.vpc.outputs.public_sub
# private_subnetid = module.vpc.outputs.private_sub
# securitygroup = module.moeez_sg.security_group_id.sg_id
# aws_vpc = module.vpc.outputs.vpc_id
# public_subnetid_1=module.vpc.outputs.public_sub_1
# }

#======================Instance======================

module "alb" {
source  = "./modules/alb"
vpc_id            = module.vpc.outputs.vpc_id
subnets           = [module.vpc.outputs.public_subnet_alb, module.vpc.outputs.public_subnet_alb1,module.vpc.outputs.public_subnet_alb2,module.vpc.outputs.public_subnet_alb3]
security_group    = [module.moeez_sg.security_group_id.alb_sg_id]
loadbalancer = var.loadbalancer
}

module "asg" {
source = "./modules/ec2"
ec2= var.ec2
public_subnetid = module.vpc.outputs.public_sub
private_subnetid = module.vpc.outputs.private_sub
securitygroup = module.moeez_sg.security_group_id.sg_id
security_group_db    = module.moeez_sg.security_group_id.db_sg_id
public_subnetid_1=module.vpc.outputs.public_sub_1
alb_target_group_arn=module.alb.outputs_alb.alb_target_group_arn
}