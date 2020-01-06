resource "aws_security_group" "webserver_sg" { 

    ingress {
        from_port = var.server_port
        to_port = var.server_port
        protocol = "tcp"
        cidr_blocks = [ var.my_public_ip ]
    }

    ingress {
        from_port = var.ssh_port
        to_port = var.ssh_port
        protocol = "tcp"
        cidr_blocks = [ var.my_public_ip ]
    }
   ingress {
        from_port = var.server_port
        to_port = var.server_port
        protocol = "tcp"
        security_groups = [ aws_security_group.elb_sg.id ]
    } 

egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }    
}
