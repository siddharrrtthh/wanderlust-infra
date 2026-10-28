resource "aws_lb" "test" {
  name               = "Wonderlust_ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [
    aws_subnet.Wonderlust_VPC_Subnet_Public.id,
    aws_subnet.Wonderlust_VPC_Subnet_Public_2.id
  ]

  enable_deletion_protection = true

   access_logs {
    bucket  = aws_s3_bucket.lb_logs.id
    prefix  = "Wonderlust-lb"
    enabled = true
  }

  depends_on = [
    aws_s3_bucket_policy.lb_logs
  ]

  tags = {
    Environment = "Wonderlust"
  }
}
