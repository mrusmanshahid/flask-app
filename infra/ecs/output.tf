
output "service_name" {
  value = aws_ecs_service.ecs_service.name
}

output "cluster_name" {
  value = aws_ecs_cluster.ecs_cluster.name
}
