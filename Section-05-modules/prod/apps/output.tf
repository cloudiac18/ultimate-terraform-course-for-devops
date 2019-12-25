output "DNS_name_elb" {
    value = [ "${aws_elb.my_first_elb.dns_name}"]
}
