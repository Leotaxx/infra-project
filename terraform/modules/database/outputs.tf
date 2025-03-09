output "db_host" {
  value = aws_db_instance.rds.address
}

output "db_password_secret_arn" {
  value     = aws_secretsmanager_secret.db_password.arn
  sensitive = true
}