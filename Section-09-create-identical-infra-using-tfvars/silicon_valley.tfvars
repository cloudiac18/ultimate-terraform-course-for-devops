#terraform init -var-file="silicon_valley.tfvars" -backend-config="key=silicon_valley/terraform.tfstate"  -reconfigure
#terraform plan -var-file="silicon_valley.tfvars"
#terraform apply -var-file="silicon_valley.tfvars"
project= "Silicon_Valley"
region = "us-east-1"
http_port = 80
ssh_port= 22 
my_system = "98.207.180.245/32"
ami ="ami-0a313d6098716f372"
instance_type = "t2.micro"