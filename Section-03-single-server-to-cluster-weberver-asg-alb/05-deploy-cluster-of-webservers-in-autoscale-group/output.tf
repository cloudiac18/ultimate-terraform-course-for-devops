output "public_ip" {
    value = [ "${aws_autoscaling_group.my_first_asg.arn}"]
}
