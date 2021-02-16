module "aws_alb" {
   source = "./modules/aws_alb_tf"
   target_group_name = var.tg_name
   target_group_port = var.tg_port
   target_group_protocol = var.tg_protocol
   target_group_vpc_id = module.vpc.vpc_id
   helth_check_port = var.health_check_port
   helth_check_protocol = var.health_check_protocol
   listener_port = var.lb_port
   listener_protocol = var.listener_protocol
   alb_name = var.lb_name
   alb_subnets = module.vpc.public_subnets
   alb_security_groups = [ module.alb_sg_ext.id, module.alb_sg.id ]
}

module "alb_sg" {
  source  = "./modules/aws_sg_tf"
  name    = "tnube_ec2_alb_sg"
  vpc_id  = module.vpc.vpc_id
  rules   = var.alb_sg_rules
  tags    = {
    project     = var.project_name
    environment = var.environment
  }
}

module "alb_sg_ext" {
  source  = "./modules/aws_sg_tf"
  name    = "tnube_ec2_alb_sg_ext"
  vpc_id  = module.vpc.vpc_id
  rules   = var.alb_sg_ext_rules
  tags    = {
    project     = var.project_name
    environment = var.environment
  }
}
