variable "region" {
  default = "us-east-1"
}
variable "http_port" {
    default = 80
}
variable "ssh_port" {
    default = 22
}
variable "my_system" {
    default = "98.207.180.245/32"
}

variable "ami" {
  # default = "ami-0a313d6098716f372"
  default="ami-07d0cf3af28718ef8"
}

variable "instance_type" {
  default = "t2.micro"
}

