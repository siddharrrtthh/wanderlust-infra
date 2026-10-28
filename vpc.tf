resource "aws_vpc" "Wonderlust_VPC" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Wonderlust"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "Wonderlust_VPC_Subnet_Private" {
  vpc_id     = aws_vpc.Wonderlust_VPC.id
  cidr_block = "10.0.0.0/20"

  tags = {
    Name = "Wonderlust-private-Subnet"
  }
}

resource "aws_subnet" "Wonderlust_VPC_Subnet_Public" {
  vpc_id                  = aws_vpc.Wonderlust_VPC.id
  cidr_block              = "10.0.16.0/20"
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "Wonderlust-Public-Subnet-1"
  }
}

resource "aws_subnet" "Wonderlust_VPC_Subnet_Public_2" {
  vpc_id                  = aws_vpc.Wonderlust_VPC.id
  cidr_block              = "10.0.32.0/20"
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "Wonderlust-Public-Subnet-2"
  }
}



resource "aws_route_table" "Wonderlust_VPC_Route_Table_Private" {
  vpc_id = aws_vpc.Wonderlust_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.Wonderlust_NATGW.id
  }

  tags = {
    Name = "Wonderlust"
  }
}

resource "aws_route_table" "Wonderlust_VPC_Route_Table_Public" {
  vpc_id = aws_vpc.Wonderlust_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Wonderlust_IGW.id
  }

  tags = {
    Name = "Wonderlust"
  }
}


resource "aws_route_table_association" "Wonderlust_VPC_Route_Table_Association_Private" {
  subnet_id      = aws_subnet.Wonderlust_VPC_Subnet_Private.id
  route_table_id = aws_route_table.Wonderlust_VPC_Route_Table_Private.id
}

resource "aws_route_table_association" "Wonderlust_VPC_Route_Table_Association_Public" {
  subnet_id      = aws_subnet.Wonderlust_VPC_Subnet_Public.id
  route_table_id = aws_route_table.Wonderlust_VPC_Route_Table_Public.id
}