
variable "cluster_name" {
    description = "The name of the ECS cluster"
    type        = string
    default     = "demo-flask-service-cluster"
}

variable "task_family" {
    description = "The family of the ECS task definition"
    type        = string
    default     = "demo-flask-service-family"
}

variable "cpu" {
    description = "The number of CPU units to use for the task"
    type        = string
    default     = "256"
}

variable "memory" {
    description = "The amount of memory (in MiB) to use for the task"
    type        = string
    default     = "512" 
}

variable "container_name" {
    description = "The name of the container"
    type        = string
    default     = "my-container"
}

variable "image_url" {
    description = "The Docker image to use for the container"
    type        = string
    default     = "demo-flask-service:latest"
}

variable "container_port" {
    description = "The port on which the container listens"
    type        = number
    default     = 80
}

variable "host_port" {
    description = "The port on the host to map to the container port"
    type        = number
    default     = 5000
}

variable "service_name" {
    description = "The name of the ECS service"
    type        = string
    default     = "demo-flask-service"
}

variable "desired_count" {
    description = "The desired number of instances of the task to run"
    type        = number
    default     = 1
}

variable "subnets" {
    description = "The subnets to launch the ECS service in"
    type        = list(string)
}

variable "security_groups" {
    description = "The security groups to associate with the ECS service"
    type        = list(string)
}

variable "db_url" {
    description = "The database URL for the application"
    type        = string
}

variable "region" {
    description = "The AWS region to deploy the ECS service in"
    type        = string
    default     = "ap-south-1"
}

variable "log_group_name" {
    description = "The name of the CloudWatch log group for the ECS service"
    type        = string
    default     = "/ecs/demo-flask-service"
}

variable "load_balancer_arn" {
    description = "The ARN of the load balancer to use with the ECS service"
    type        = string
}
