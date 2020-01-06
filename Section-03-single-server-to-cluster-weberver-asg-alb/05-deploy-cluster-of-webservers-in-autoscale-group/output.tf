output "asg_arn" {
    value = [ "${aws_autoscaling_group.my_first_asg.arn}"]
}
