resource "aws_launch_template" "web" {
  name_prefix   = "web-template"
  image_id      = "ami-08b5b3a93ed654d19" # Update for your AWS region
  instance_type = "t3.micro"
}

resource "aws_autoscaling_group" "web_asg" {
  vpc_zone_identifier = [var.subnet_id]  # 🔥 FIXED! Now using the correct variable
  desired_capacity    = 2
  max_size           = 5
  min_size           = 2

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "webserver-asg"
    propagate_at_launch = true
  }
}