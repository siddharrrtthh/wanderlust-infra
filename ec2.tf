resource "aws_instance" "Jenkins-Master" {
  ami           = "ami-0c7dc2f4e28e6e66e"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.Wonderlust_VPC_Subnet_Private.id
  associate_public_ip_address = false
  security_groups = [ aws_security_group.ec2_sg.name] 

  tags = {  
    Name = "Wonderlust"
  }

  root_block_device {
    volume_size = 30 
    volume_type = "gp3"
  }
}


resource "aws_instance" "Jenkins-Salve" {
  ami           = "ami-0c7dc2f4e28e6e66e"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.Wonderlust_VPC_Subnet_Private.id
  associate_public_ip_address = false
  security_groups = [ aws_security_group.ec2_sg.name] 

  tags = {  
    Name = "Wonderlust"
  }

}