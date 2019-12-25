resource "aws_instance" "hello-world" {
    ami = "${var.ami}" 
 instance_type = "${var.instance_type}"
 vpc_security_group_ids = ["${aws_security_group.webserver_sg.id}"]
 key_name = "terraform"
 tags = {
	 Name = "Hello world"
 }

provisioner "remote-exec" { 
    inline = [
        "sudo /usr/bin/apt-get update",
        "sudo DEBIAN_FRONTEND=noninteractive /usr/bin/apt-get upgrade -yq",
        "sudo /usr/bin/apt-get install apache2 -y",
        "sudo /usr/sbin/ufw allow in 'Apache Full' ",
        "sudo /bin/chmod 757  /var/www/html/index.html",
        "sudo /bin/echo 'Hello world' >/var/www/html/index.html",
        "instance_ip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`",
        "sudo echo $instance_ip >>/var/www/html/index.html", 
     ]
     connection {
        type = "ssh"
        user = "ubuntu"
        private_key=file("./terraform.pem")
        host = self.public_ip
    }
}
#  user_data = <<-EOF
#  #!/bin/bash
#     exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
#     /usr/bin/apt-get update
#     DEBIAN_FRONTEND=noninteractive /usr/bin/apt-get upgrade -yq
#     /usr/bin/apt-get install apache2 -y
#     /usr/sbin/ufw allow in "Apache Full"
# 	/bin/echo "Hello world " >/var/www/html/index.html
#     instance_ip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
#     echo $instance_ip >>/var/www/html/index.html
#  EOF

}