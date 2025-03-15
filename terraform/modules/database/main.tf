resource "aws_db_instance" "rds" {
  identifier            = "retail-rds-instance"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  username            = "admin"
  password            = aws_secretsmanager_secret_version.db_password.secret_string
  parameter_group_name = "default.mysql8.0"
  publicly_accessible = true
  skip_final_snapshot = true
  multi_az = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
}

# Store database password securely in AWS Secrets Manager
resource "aws_secretsmanager_secret" "db_password" {
  name = "retail-rds-pw"
}

resource "aws_secretsmanager_secret_version" "db_password" {
  secret_id     = aws_secretsmanager_secret.db_password.id
  secret_string = "retail2025"  # Replace with a safer method to store passwords
}
resource "aws_security_group" "rds_sg" {
  name        = "rds-security-group"
  description = "Allow MySQL access"
  vpc_id      = var.vpc_id  # ✅ Corrected Reference

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # ⚠️ Public access, restrict in production!
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [var.public_subnet_1_id, var.public_subnet_2_id]  # Use the correct subnets
  description = "Subnet group for RDS instance"
}

/* 
resource "aws_db_instance" "read_replica" {
  replicate_source_db = aws_db_instance.rds.id
  instance_class      = "db.t3.micro"  
  publicly_accessible = false
  skip_final_snapshot = true
}
*/
