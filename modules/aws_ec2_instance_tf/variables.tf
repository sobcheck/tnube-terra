variable "count_index" {
  default = "1"
}

variable "ami" {
}

variable "instance_type" {
}

variable "subnet_ids" {
  type = list
}

variable "vpc_security_group_ids" {
  type  = list
}

variable "key_name" {
}

variable "tags" {
  type = map
}

variable "role" {
}

variable "public" {
}

variable "volume_size" {
  default = "10"
}

variable "volume_type" {
  default = "gp2"
}

variable "disable_api_termination" {
  default = "false"
}

variable "iam_instance_profile" {
  default = ""
}

variable "user_data" {
  default = ""
}
