variable environment {}
variable project_name {}


##  VPC ##
variable vpc_name {}
variable cidr {}
variable azs {
  type = list
}
variable private_subnets {
  type = list
}
variable public_subnets {
  type = list
}

## Application Load Balancer ##
variable "lb_name" {}
variable "listener_protocol" {}
variable "lb_port" {}
variable "tg_name" {}
variable "tg_port" {}
variable "tg_protocol" {}
variable "health_check_path" {}
variable "health_check_port" {}
variable "health_check_protocol" {}

## Instances ##
variable "ami" {}
variable "flavor" {}
variable "instance_port" {}
variable "instance_count" {}
variable "role" {}
variable "ssh_key" {}

## Security Groups ##
variable sg_alb_name {}
variable sg_alb_ext_name {}
variable "instance_sg_rules" {
  type = list
}
variable "instance_sg_ext_rules" {
  type = list
}
variable "alb_sg_rules" {
  type = list
}
variable "alb_sg_ext_rules" {
  type = list
}
