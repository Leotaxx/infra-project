resource "aws_instance" "web_primary" {
  ami           = "ami-08b5b3a93ed654d19"
  instance_type = "t3.micro"
  subnet_id     = var.public_subnet_1_id  # ✅ Use variable instead of module reference
  security_groups = [var.web_sg_id]       # ✅ Use variable instead of module reference
  associate_public_ip_address = true
  key_name ="trojan"
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    Name = "Web Primary"
  }
}

resource "aws_instance" "web_secondary" {
  ami           = "ami-08b5b3a93ed654d19"
  instance_type = "t3.micro"
  subnet_id     = var.public_subnet_2_id  # ✅ Use variable instead of module reference
  security_groups = [var.web_sg_id]       # ✅ Use variable instead of module reference
  associate_public_ip_address = true
  key_name ="trojan"
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    Name = "Web Secondary"
  }
}


resource "aws_lb" "web_lb" {
  name               = "web-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.web_sg_id] # ✅ Fix: Use variable instead of module reference
  subnets           = [var.public_subnet_1_id, var.public_subnet_2_id] # ✅ Fix: Use variables
}