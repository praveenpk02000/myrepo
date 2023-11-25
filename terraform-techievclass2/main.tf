#instance creation

resource "aws_instance" "r100c96" {
  ami           = "ami-05c13eab67c5d8861" 
  instance_type = "t2.small"
  subnet_id = aws_subnet.publicsub1.id
  vpc_security_group_ids = [aws_security_group.techievsg1.id]
  key_name = "${var.key_pair_name}"
  associate_public_ip_address = true

  tags = {
    Name = "terraform instance"
  }
}






