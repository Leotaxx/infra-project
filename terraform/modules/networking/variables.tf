variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr_block_1" {
  description = "CIDR block for the first public subnet"
  type        = string
}

variable "public_subnet_cidr_block_2" {
  description = "CIDR block for the second public subnet"
  type        = string
}