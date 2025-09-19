
  output "alb_arn" {
  value = module.lb.alb_arn
}

  output "alb_target_group_arn" {
  value = module.lb.alb_target_group_arn
}
/*
  output "alb_listener_https" {
  value = module.lb.
}
*/
  output "nlb_target_group_arn" {
  value = module.lb.nlb_target_group_arn
  }

  output "aws_nlb_arn" {
  value = module.lb.nlb_arn
}

output "nlb_listener_was" {
  value = module.lb.nlb_listener_was
}


output "alb_dns_name" {
  value = module.lb.alb_dns_name
}


output "alb_zone_id" {
  value = module.lb.alb_zone_id
}
output "nlb_dns_name" {
  value = module.lb.nlb_dns_name
}
