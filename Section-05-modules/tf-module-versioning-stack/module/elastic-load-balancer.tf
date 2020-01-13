resource "aws_elb" "my_first_elb" {
    name = "${var.cluster}-terraform-elb-${var.environment}"
    availability_zones = var.azs
    security_groups=[ aws_security_group.webserver_sg.id ]
    listener {
        lb_port=80
        lb_protocol ="http"
        instance_port = var.http_port
        instance_protocol= "http"
    }
    health_check {
        healthy_threshold = 2
        unhealthy_threshold = 2
        timeout=3
        interval = 30
        target = "HTTP:${var.http_port}/"
    }

}
