resource "aws_instance" "jenkins" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name = "prodit"
user_data = <<EOC
#!/bin/bash -xe
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
yum install java-1.8.0-openjdk-devel
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum install jenkins
systemctl start jenkins
systemctl status jenkins
EOC

  tags = {
    Name = var.project
  }
}
