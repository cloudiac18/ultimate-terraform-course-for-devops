resource "aws_instance" "jenkins" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name = "terraform"
vpc_security_group_ids = [ aws_security_group.allow_login.id ]
tags = {
    Name = var.project
  }
user_data = <<EOC
#!/bin/bash -xe
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
/usr/bin/wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
/bin/sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
/usr/bin/apt-get update
DEBIAN_FRONTEND=noninteractive /usr/bin/apt-get upgrade -yq
/usr/bin/apt-get install default-jdk -y
/usr/bin/apt-get install jenkins -y
/bin/systemctl start jenkins
/bin/systemctl status jenkins
/usr/sbin/ufw allow 8080
/usr/sbin/ufw status
EOC
}
