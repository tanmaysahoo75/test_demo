resource "aws_elb" "bar" {
	name = "raham-terraform-elb"
	availability_zones = ["eu-west-3a","eu-west-3b"]
	
	listener {
	  instance_port	= 80
	  instance_protocol = "http"
	  lb_port	   = 80
	  ib_protocol	   = "http"
}

health_check {
	healthy_threshold	= 3
	unhealthy_threshold	= 5
	timeout			= 5
	target 			= "HTTP:80/"
	interval		= 30
}

instance	= ["$aws_instance.one.id}","${aws_instance.two.id}"]
cross_zone_load_balancing = true
idle_timeout  = 400
tags = {
 Name = "raham-tf-elb"
 }
}
