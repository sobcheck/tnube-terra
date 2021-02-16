module "tnube_instance_apache"{
  source = "./modules/aws_ec2_instance_tf"
  ami = var.ami
  instance_type = var.flavor
  subnet_ids = module.vpc.private_subnets
  public = "false"
  key_name = var.ssh_key
  role = var.role
  count_index = var.instance_count
  vpc_security_group_ids  = [ module.apache_sg_ext_tf.id, module.apache_sg_tf.id ]
  user_data = "${file("user-data/apache.sh")}"

  tags = {
    env = var.environment
    name = "tnube-instance-apache"
    type = "webserver"
    project = var.project_name
  }
}

module "apache_sg_tf" {
  source  = "./modules/aws_sg_tf"
  name    = "tnube-apache-sg"
  vpc_id  = module.vpc.vpc_id
  rules   = var.instance_sg_ext_rules

  tags = {
    env = var.environment
    project = var.project_name
  }
}

module "apache_sg_ext_tf" {
  source  = "./modules/aws_sg_tf"
  name    = "tnube-apache-sg-ext"
  vpc_id  = module.vpc.vpc_id
  rules   = var.instance_sg_ext_rules

  tags = {
    env = var.environment
    project = var.project_name
  }

}

resource "aws_lb_target_group_attachment" "tg_apache" {
  target_group_arn = module.aws_alb.tg_arn
  target_id        = module.tnube_instance_apache.id[0]
  port             = 80
}
