output "elb_endpoint" {
    value = [ "${aws_elb.my_first_elb.dns_name}"]
}
