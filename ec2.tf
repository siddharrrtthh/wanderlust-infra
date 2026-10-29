resource "aws_instance" "example" {
  ami           = "ami-0c7dc2f4e28e6e66e"
  instance_type = "t2.large"

  tags = {
    Name = "Wonderlust"
  }
}