variable "target_group_name" {
}
variable "target_group_port" {
}
variable "target_group_protocol" {
}
variable "target_group_vpc_id" {
}
variable "helth_check_port" {
}
variable "helth_check_protocol" {
}
variable "target_group_tags" {
  default     = {}
}
variable "listener_port" {
}
variable "listener_protocol" {
}
variable "alb_name" {
}
variable "tags" {
  default     = {}
}
variable "alb_subnets" {
  type = list(string)
}
variable "alb_security_groups" {
  type = list(string)
}
