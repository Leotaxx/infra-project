output "public_subnet_1_id" {
  value = aws_subnet.public_subnet_1.id
}

output "public_subnet_2_id" {
  value = aws_subnet.public_subnet_2.id
}

output "web_sg_id" {
  value = aws_security_group.web_sg.id
}
output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}

output "public_route_table_id" {
  value = aws_route_table.public_route_table.id
}

output "vpc_id" {
  value = aws_vpc.main.id
  description = "The ID of the VPC"
}