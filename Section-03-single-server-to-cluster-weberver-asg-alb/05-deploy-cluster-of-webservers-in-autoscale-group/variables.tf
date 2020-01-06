variable "region" {
	description = " it will define the AWS region "
	default = "us-east-1"
}
variable "server_port" {
	description = " http service listen on ths port "
	default = "80"
}

variable "ssh_port" {
	description = "ssh request to server  "
	default = "22"
}
variable "instance_type" { 
	description = "AWS ec2 instance type"
	default="t2.micro"
}
variable "my_public_ip" {
	description = "My local system public IP ..." 
        default = "98.207.180.245/32"
}
variable "ami" {
description = "amazon machine image"
default = "ami-0a313d6098716f372"
}

variable "azs" {
default = [ "us-east-1a", "us-east-1b", "us-east-1c"]
}
