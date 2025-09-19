
  output "alb_arn" {
  value = aws_lb.tf_alb.arn
}

  output "alb_target_group_arn" {
  value = aws_lb_target_group.tf_alb_tg.arn
}
/*
  output "alb_listener_https" {
  value = aws_lb_listener.front_end.id
}
*/
  output "nlb_arn" {
  value = aws_lb.tf_nlb.arn
}

  output "nlb_target_group_arn" {
  value = aws_lb_target_group.tf_nlb_tg_was.arn
}

  output "nlb_listener_was" {
  value = aws_lb_listener.back_end_was.id
}


output "alb_dns_name" {
  value = aws_lb.tf_alb.dns_name
}

output "alb_zone_id" {
  value = aws_lb.tf_alb.zone_id
}

output "nlb_dns_name" {
  value = aws_lb.tf_nlb.dns_name
}

