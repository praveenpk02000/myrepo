resource "aws_security_group" "techievsg1" {
  name_prefix = "techievsg1"
  description = "techiev Security Group"
  vpc_id      = aws_vpc.terraform.id

  // Ingress rules (inbound traffic)
  // Example: Allow SSH (Port 22) from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Egress rules (outbound traffic)
  // Example: Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}