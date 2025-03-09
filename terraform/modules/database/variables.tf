variable "vpc_id" {
  description = "VPC ID for the database security group"
  type        = string
}

variable "public_subnet_1_id" {
  description = "Public Subnet 1 ID"
  type        = string
}

variable "public_subnet_2_id" {
  description = "Public Subnet 2 ID"
  type        = string
}