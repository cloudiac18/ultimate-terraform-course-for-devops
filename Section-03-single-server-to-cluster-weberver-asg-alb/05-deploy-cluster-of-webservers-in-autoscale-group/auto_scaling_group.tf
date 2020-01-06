resource "aws_autoscaling_group" "my_first_asg" {
	launch_configuration = aws_launch_configuration.my-first-launch-conf.id
	availability_zones = var.azs
    
	min_size = 2
	max_size = 10
	desired_capacity = 3
	tag {
		key = "Name"
		value = "terraform-asg"
		propagate_at_launch = true  
	}
}
