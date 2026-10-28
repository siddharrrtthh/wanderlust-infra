# Get AWS account ID and current Region
data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

# 1. Create S3 bucket for ALB access logs
resource "aws_s3_bucket" "lb_logs" {
  bucket = "wonderlust-alb-logs-2026"

  tags = {
    Name        = "Wonderlust-ALB-Logs"
    Environment = "Production"
  }
}

resource "aws_s3_bucket_policy" "lb_logs" {
  bucket = aws_s3_bucket.lb_logs.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "logdelivery.elasticloadbalancing.amazonaws.com"
        }

        Action = "s3:PutObject"

        Resource = "${aws_s3_bucket.lb_logs.arn}/test-lb/AWSLogs/${data.aws_caller_identity.current.account_id}/*"

        Condition = {
          ArnLike = {
            "aws:SourceArn" = "arn:aws:elasticloadbalancing:${data.aws_region.current.region}:${data.aws_caller_identity.current.account_id}:loadbalancer/*"
          }
        }
      }
    ]
  })
}





