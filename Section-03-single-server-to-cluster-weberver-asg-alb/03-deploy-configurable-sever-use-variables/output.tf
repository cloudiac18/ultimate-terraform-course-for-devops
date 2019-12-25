output "public_ip" {
    value = "${aws_instance.My-Webserver.public_ip}"
}
