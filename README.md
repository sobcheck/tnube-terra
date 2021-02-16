# tnube-terra

## Requirements

| Name      | Version   |
| --------- | --------- |
| terraform | >= 0.13.0 |

## Description

To use this repository yo have to create aws access (access_key and secret_key) and a key pair.
You must configure your aws access in the file provider.tf and complete the variable ssh_key with you key_pair name in the file terraform.tfvars

With this script you will create an ALB with target group, two ec2 instances (one whith apache and one with nginx), security groups (private and external to instances and to ALB) and VPC
