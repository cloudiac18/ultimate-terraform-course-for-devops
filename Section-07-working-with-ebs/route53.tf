resource "aws_route53_zone" "my_private_zone" {
  name = "myr53zone.com"
}

resource "aws_route53_record" "webserver" {
    zone_id = "${aws_route53_zone.my_private_zone.zone_id}"
    name    = "web.myr53zone.com"
    type    = "A"
  ttl     = "300"
  records = ["${aws_instance.hellow-world.private_ip}"]
}