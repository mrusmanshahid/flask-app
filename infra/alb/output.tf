output "alb_dns_name" {
  value = aws_lb.app_alb.dns_name
}

output "arn" {
  value = aws_lb.app_alb.arn
}

output "app_tg_arn" {
  value = aws_lb_target_group.app_tg.arn
}