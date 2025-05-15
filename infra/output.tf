

output "ecr_repository_url" {
  value = module.demo_flask_app_ecr.ecr_repository_url
}


output "alb_dns_name" {
  value = module.demo_flask_app_alb.alb_dns_name
}
