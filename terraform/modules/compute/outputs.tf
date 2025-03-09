output "lb_dns_name" {
  value = aws_lb.web_lb.dns_name
}

output "lb_zone_id" {
  value = aws_lb.web_lb.zone_id
}

output "primary_public_ip" {
  value = aws_instance.web_primary.public_ip
}

output "secondary_public_ip" {
  value = aws_instance.web_secondary.public_ip
}