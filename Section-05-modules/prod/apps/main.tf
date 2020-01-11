module "webservers" {
#  source        = "git::https://github.com/cloudiac18/ultimate-terraform-course-for-devops.git//Section-05-modules/modules/webservers-elb-asg?ref=v0.0.11"
source        = "../../module/webservers-elb-asg"
  instance_type = "t2.micro"
  environment = "prod"
  cluster = "prod"
  vpc_id = "vpc-cd8735b7"
}
resource "aws_security_group_rule" "allow_mytest" {
  type = "ingress"
  security_group_id = module.webservers.my_module_sg_id
          from_port = "20000"
         to_port = "20000"
         protocol = "tcp"
         cidr_blocks = [ "0.0.0.0/0"]
}
