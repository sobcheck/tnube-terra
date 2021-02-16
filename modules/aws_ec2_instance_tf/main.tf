terraform {
  required_version = ">= 0.12"
}

resource "aws_instance" "main" {
  count                       = var.count_index
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = element(var.subnet_ids, count.index)
  vpc_security_group_ids      = var.vpc_security_group_ids
  disable_api_termination     = false
  iam_instance_profile        = var.iam_instance_profile
  associate_public_ip_address = var.public
  tags                        = var.tags
  user_data                   = var.user_data

  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }
}
