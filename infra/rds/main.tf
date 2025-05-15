resource "aws_db_subnet_group" "rds" {
  name       = "rds-subnet-group"
  subnet_ids = var.subnets
}

resource random_password "db_password" {
  length  = 16
  special = false
}

resource "aws_db_instance" "flask_db" {
  identifier         = var.instance_name
  engine             = "postgres"
  instance_class     = "db.t3.micro"
  allocated_storage  = 20
  db_name            = "flaskdb"
  username           = "flaskuser"
  password           = random_password.db_password.result
  port               = 5432
  multi_az           = false
  publicly_accessible = true
  vpc_security_group_ids = var.security_groups
  db_subnet_group_name   = aws_db_subnet_group.rds.name
  skip_final_snapshot    = true
}
