environment = "exam-tnube"
project_name = "tienda-nube-test-tf"

## VPC ##
vpc_name = "tnube-vpc-tf"
cidr = "10.0.0.0/16"
azs = ["us-east-1a", "us-east-1b", "us-east-1c"]
private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

## ALB ##
lb_name = "tnube-lb-tf"
lb_port = "80"
listener_protocol = "HTTP"

## SG ##
sg_alb_name = "tnube-alb-sg-tf"
sg_alb_ext_name = "tnube-alb-sg-ext-tf"

## Instance ##
ami = "ami-02fe94dee086c0c37"
flavor = "t2.micro"
instance_port = "80"
instance_count = "1"
role = "webserver"
ssh_key = "webservers"

## Target Group ##
tg_name = "tnube-tg-tf"
tg_port = "80"
tg_protocol = "HTTP"
health_check_path = "/"
health_check_port = "80"
health_check_protocol = "HTTP"

instance_sg_ext_rules = [
  { type = "ingress", protocol = "all", from_port = -1, to_port = -1, cidr_blocks = "10.0.0.0/16", description = "External ingress" },
  { type = "egress", protocol = "all", from_port = 0, to_port = 0, cidr_blocks = "0.0.0.0/0", description = "External ingress" },
]

instance_sg_rules = [
  { type = "ingress", protocol = "all", from_port = -1, to_port = -1, cidr_blocks = "10.0.0.0/16", description = "Internal ingress" },
  { type = "egress", protocol = "all", from_port = 0, to_port = 0, cidr_blocks = "0.0.0.0/0", description = "Internal egress" },
]

alb_sg_ext_rules = [
  { type = "ingress", protocol = "tcp", from_port = 80, to_port =80, cidr_blocks = "0.0.0.0/0", description = "External ingress" },
  { type = "egress", protocol = "all", from_port = 0, to_port = 0, cidr_blocks = "0.0.0.0/0", description = "External ingress" },
]

alb_sg_rules = [
  { type = "ingress", protocol = "all", from_port = 80, to_port = 80, cidr_blocks = "0.0.0.0/0", description = "Internal ingress" },
  { type = "egress", protocol = "all", from_port = 0, to_port = 0, cidr_blocks = "0.0.0.0/0", description = "Internal egress" },
]
