
variable "vpc_id" {
  description = "The VPC ID to launch the ALB in"
  type        = string
}

variable "subnets" {
  description = "The subnets to launch the ALB in"
  type        = list(string)
}

variable "security_groups" {
  description = "The security groups to associate with the ALB"
  type        = list(string)
}

variable "alb_name" {
  description = "The name of the ALB"
  type        = string
  default     = "demo-flask-alb"
}