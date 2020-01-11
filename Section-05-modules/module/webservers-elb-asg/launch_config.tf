resource "aws_launch_configuration" "my-first-launch-conf" {
name = "${var.cluster}-webserver-launch"
image_id = var.ami
instance_type = var.instance_type
security_groups=[ aws_security_group.webserver_sg.id ]
key_name = "terraform"

lifecycle {
      create_before_destroy = true
}
user_data=file("${path.module}/user_data.sh")
# user_data = <<-EOF
# 	#!/bin/bash
#         exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
#         /usr/bin/apt-get update
#         DEBIAN_FRONTEND=noninteractive /usr/bin/apt-get upgrade -yq
#         /usr/bin/apt-get install apache2 -y
#         /usr/sbin/ufw allow in "Apache Full"
# 	/bin/echo "Hello world " >/var/www/html/index.html
# 	EOF
}

#user_data="${file("user_data.sh")}"
