data "aws_vpc" "default" {
}


#resource "local_file" "application_dev_ip"{
#  content = "${aws_instance.application_dev.private_ip}"
#  filename = "/home/mariia/fintask_terraform/app_dev_ip.txt"
#}


#resource "local_file" "application_prod_ip"{
#  content = "${aws_instance.application_prod.private_ip}"
#  filename = "/home/mariia/fintask_terraform/app_prod_ip.txt"
#}

