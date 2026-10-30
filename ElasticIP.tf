resource "aws_eip" "Wonderlust_EIP" {
  domain = "vpc"

  tags = {
    Name = "Wonderlust"
  }
  
}