module "webservers" {
  source        = "../../modules/webservers-elb-asg"
  instance_type = "t2.micro"
}
resource "aws_security_group_rule" "allow_mytest" {
  type = "ingress"
  security_group_id = module.webservers.my_module_sg_id
          from_port = "10000"
         to_port = "10000"
         protocol = "tcp"
         cidr_blocks = [ "0.0.0.0/0"]
}
