output "DNS_name_elb" {
    description = "outputs dns endpoint of the ELB" 
    value ="${aws_elb.my_first_elb.dns_name}"
}

output "my_module_sg_id" {
    description = "outputs webserver security group id"
    value ="${aws_security_group.webserver_sg.id}"
}
