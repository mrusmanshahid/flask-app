
locals {

  service_name    = "demo-flask-app"
  cpu             = "256"
  memory          = "512"
  container_port  = 5000
  host_port       = 5000
  desired_count   = 1
  subnets         = ["subnet-1b4d9673", "subnet-2717026a"]
  security_groups = ["sg-0a050b60e4de0e14b"]
  vpc_id          = "vpc-40855928"

  # Below are the local variables that are automatically generated to force standard
  ecr_repository_name = format("%s-%s", local.service_name, "repo")
  cluster_name        = format("%s-%s", local.service_name, "cluster")
  task_family         = format("%s-%s", local.service_name, "task")
  container_name      = format("%s-%s", local.service_name, "container")
  alb_name            = format("%s-%s", local.service_name, "alb")
}

module "demo_flask_app_rds" {
  source          = "./rds"
  instance_name   = local.service_name
  security_groups = local.security_groups
  subnets         = local.subnets
}

module "demo_flask_app_ecr" {
  source              = "./ecr"
  ecr_repository_name = local.ecr_repository_name
}

module "demo_flask_app_alb" {
  source          = "./alb"
  alb_name        = local.alb_name
  security_groups = local.security_groups
  subnets         = local.subnets
  vpc_id          = local.vpc_id
}

module "demo_flask_app_ecs" {
  source            = "./ecs"
  cluster_name      = local.cluster_name
  task_family       = local.task_family
  cpu               = local.cpu
  memory            = local.memory
  container_name    = local.container_name
  image_url         = format("%s:%s", module.demo_flask_app_ecr.ecr_repository_url, var.deploy_version)
  container_port    = local.container_port
  host_port         = local.host_port
  service_name      = local.service_name
  desired_count     = local.desired_count
  security_groups   = local.security_groups
  subnets           = local.subnets
  db_url            = format("postgresql://%s:%s@%s/%s", module.demo_flask_app_rds.username, module.demo_flask_app_rds.password, module.demo_flask_app_rds.endpoint, module.demo_flask_app_rds.db_name)
  load_balancer_arn = module.demo_flask_app_alb.app_tg_arn
}
