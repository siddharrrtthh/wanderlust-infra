resource "aws_internet_gateway" "Wonderlust_IGW" {
  vpc_id = aws_vpc.Wonderlust_VPC.id

  tags = {
    Name = "Wonderlust"
  }
}

