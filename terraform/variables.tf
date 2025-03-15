variable "aws_region_primary" { default = "us-east-1" }
variable "aws_region_secondary" { default = "us-west-2" }
variable "instance_type" { default = "t3.micro" }
variable "db_instance_type" { default = "db.t3.medium" }
variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
  default     = ""
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
  default     = ""
}
variable "aws_secret_session_token"{
    description = "AWS Session token"
    type        = string
    default     = ""
}
