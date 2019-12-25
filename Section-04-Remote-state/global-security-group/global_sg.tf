resource "aws_security_group" "allow_db" {
  name        = "allow_db"
  description = "Allow TLS inbound traffic"
 

  ingress {
    
    from_port   = 1521
    to_port     = 1521
    protocol    = "tcp"
    cidr_blocks = ["10.145.8.0/25"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    
  }
}
