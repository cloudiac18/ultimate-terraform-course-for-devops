resource "aws_ebs_volume" "web-ebs" {
 availability_zone = "${var.az}"
size = 10
type = "gp2"
tags = {
    Name = "webserver_data"
} 
}  
resource "aws_volume_attachment" "web-ebs-attach" {
    device_name = "/dev/sdd"
    volume_id = "${aws_ebs_volume.web-ebs.id}"
    instance_id="${aws_instance.hellow-world.id}"
}