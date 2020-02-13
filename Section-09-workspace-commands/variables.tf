variable "instance_type" {
  type = map
  
  default = {
   default = "t2.nano"
   stage = "t2.micro"
   prod = "t2.large"

  }
}


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
  default = "ami-0a313d6098716f372"
}


