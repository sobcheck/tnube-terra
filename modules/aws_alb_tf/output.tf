output "dns_name" {
  value = "${aws_lb.alb_main.dns_name}"
}

output "id" {
  value = "${aws_lb.alb_main.id}"
}

output "tg_arn" {
  value = "${aws_lb_target_group.tg_main.arn}"
}
