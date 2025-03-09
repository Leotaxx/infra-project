output "web_primary_ip" {
  value = module.compute.primary_public_ip
}

output "web_secondary_ip" {
  value = module.compute.secondary_public_ip
}

output "db_host" {
  value = module.database.db_host
}

output "db_password_secret_arn" {
  value     = module.database.db_password_secret_arn
  sensitive = true
}