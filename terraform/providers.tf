provider "aws" {
  region = var.aws_region_primary
}
provider "aws" {
  alias  = "primary"
  region = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  session_token=var.aws_secret_session_token
}

provider "aws" {
  alias  = "secondary"
  region = "us-west-2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  session_token=var.aws_secret_session_token
}
terraform {
  backend "s3" {
    bucket         = "infra-project-terraform-state-bucket"
    key            = "infra/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile   = true  # ✅ Replace deprecated dynamodb_table
  }
}