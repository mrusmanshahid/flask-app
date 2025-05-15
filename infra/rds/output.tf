
output "name" {
  value = aws_db_instance.flask_db.id
}

output "endpoint" {
  value = aws_db_instance.flask_db.endpoint
}

output "port" {
  value = aws_db_instance.flask_db.port
}

output "username" {
  value = aws_db_instance.flask_db.username
}

output "password" {
  value = random_password.db_password.result
}

output "db_name" {
  value = aws_db_instance.flask_db.db_name
}
