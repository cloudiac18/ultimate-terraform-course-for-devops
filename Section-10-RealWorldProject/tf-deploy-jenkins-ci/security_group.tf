resource "aws_security_group" "allow_login" {
  description = "Allow  inbound traffic"

  ingress {
    description = "allow ssh to system"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.mysystem]
  }
  ingress {
    description = "allow ssh to system"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.mysystem]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

