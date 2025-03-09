# Create an S3 bucket to store application code
resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket = "webapp-codepipeline-bucket"
  force_destroy = true
}

# IAM Role for CodePipeline
resource "aws_iam_role" "codepipeline_role" {
  name = "codepipeline-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "codepipeline.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

# IAM Policy for CodePipeline
resource "aws_iam_policy" "codepipeline_policy" {
  name = "codepipeline-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:*",
          "codecommit:*",
          "codedeploy:*",
          "ec2:*",
          "iam:PassRole"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "codepipeline_attachment" {
  policy_arn = aws_iam_policy.codepipeline_policy.arn
  role       = aws_iam_role.codepipeline_role.name
}

# CodeDeploy Application
resource "aws_codedeploy_app" "webapp" {
  name = "webapp-deployment"
}

# Deployment Group for EC2 Instances
resource "aws_codedeploy_deployment_group" "webapp_group" {
  app_name              = aws_codedeploy_app.webapp.name
  deployment_group_name = "webapp-group"
  service_role_arn      = aws_iam_role.codepipeline_role.arn

  ec2_tag_set {
    ec2_tag_filter {
      key   = "Environment"
      value = "production"
      type  = "KEY_AND_VALUE"
    }
  }
}