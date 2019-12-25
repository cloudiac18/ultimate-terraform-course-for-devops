resource "aws_security_group" "webserver_sg" { 

    ingress {
        from_port = "${var.http_port}"
        to_port = "${var.http_port}"
        protocol = "tcp"
        cidr_blocks = [ "${var.my_system}"]
    }
     ingress {
        from_port = "${var.ssh_port}"
        to_port = "${var.ssh_port}"
        protocol = "tcp"
        cidr_blocks = [ "${var.my_system}"]
    }
   egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  } 

} 

data "terraform_remote_state" "global_sg" {
  backend = "s3"
  config = {
    bucket = "terraformiac-mystach-tfstate"
    key = "global_security_group/terraform.tfstate"
    region="us-east-1"
  }
}


