
resource "aws_security_group" "lb_sg" {
  name        = "Wonderlust-ALB-SG"
  description = "Allow HTTP and HTTPS traffic to ALB"
  vpc_id      = aws_vpc.Wonderlust_VPC.id

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # semantically equivalent to all ports
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Wonderlust"
  }
}
