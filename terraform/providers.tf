provider "aws" {
  alias  = "primary"
  region = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  session_token=var.aws_session_token
}

provider "aws" {
  alias  = "secondary"
  region = "us-west-2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  session_token=var.aws_session_token
}