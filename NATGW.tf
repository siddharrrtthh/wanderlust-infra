resource "aws_nat_gateway" "Wonderlust_NATGW" {
  allocation_id = aws_eip.Wonderlust_EIP.id
  subnet_id     = aws_subnet.Wonderlust_VPC_Subnet_Public.id

  tags = {
    Name = "Wonderlust"
  }

  depends_on = [
    aws_internet_gateway.Wonderlust_IGW
  ]
}
