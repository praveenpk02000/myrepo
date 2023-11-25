provider aws {
    region =  "us-east-1"
    access_key = "************"
    secret_key = "**************"
}

#instance creation

resource "aws_instance" "r100c96" {
  ami           = "ami-05c13eab67c5d8861" 
  instance_type = "t2.small"
  associate_public_ip_address = true

  tags = {
    Name = "terraform instance"
  }
}

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

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "f9o$!$#2bba0z"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}


resource "aws_s3_bucket" "b" {
  bucket = "my-tf-testtechiev-bucket"
  acl    = "private"
  tags = {
    Name        = "My tf bucket"
    Environment = "Dev"
  }
}


