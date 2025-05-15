
variable "security_groups" {
    description = "The security groups to associate with the database"
    type        = list(string)
}

variable "subnets" {
    description = "The subnets to launch the database in"
    type        = list(string)
}

variable "instance_name" {
    description = "The name of the RDS instance"
    type        = string
    default     = "demo-flask-db"
}