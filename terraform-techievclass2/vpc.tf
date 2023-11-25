#vpc creation
resource "aws_vpc" "terraform" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "terraform"
  }
}

resource "aws_subnet" "publicsub1" {
  vpc_id     = aws_vpc.terraform.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "subentsub1"
  }
}

resource "aws_subnet" "publicsub2" {
  vpc_id     = aws_vpc.terraform.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "subentsub2"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.terraform.id

  tags = {
    Name = "gw"
  }
}

resource "aws_route_table" "terraform_rw" {
  vpc_id = aws_vpc.terraform.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "terraform_rw"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.publicsub1.id
  route_table_id = aws_route_table.terraform_rw.id
}