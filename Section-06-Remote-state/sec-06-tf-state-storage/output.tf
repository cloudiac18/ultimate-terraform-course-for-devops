output "public_ip" {
    value = [ "${aws_instance.hellow-world.*.public_ip}"]
}
