

resource "aws_instance" "application_dev" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = "${aws_subnet.publicnet_app_dev.id}"
  key_name = var.keys
  security_groups = [ "${aws_security_group.applicationgr.id}" ]
  user_data = file("ubuntu.sh")

  tags = {
    Name = "application_dev"
  }
}


resource "aws_instance" "application_prod" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = "${aws_subnet.publicnet_app_prod.id}"
  key_name = var.keys
  security_groups = [ "${aws_security_group.applicationgr.id}" ]
  user_data = file("ubuntu.sh")

  tags = {
    Name = "application_prod"
  }
}


resource "aws_instance" "myjenkins" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = "${aws_subnet.publicnet_jenkins.id}"
  key_name = var.keys
  security_groups = [ "${aws_security_group.jenkinsgr.id}" ]
  user_data = file("jenkins.sh")

  connection {
    type = "ssh"
    user        = "${var.ssh_user}"
    private_key = "${file(var.private_key_path)}"
    host = self.public_ip
  } 

   provisioner "file" {
  #  source = local_file.application_dev_ip.filename
    content      = "${aws_instance.application_dev.private_ip}"
    destination = "/home/ubuntu/app_dev_ip.txt"
  }
   provisioner "file" {
#   source = local_file.application_prod_ip.filename
   content      = "${aws_instance.application_prod.private_ip}"
    destination = "/home/ubuntu/app_prod_ip.txt"
  }

  tags = {
    Name = "myjenkins"
  }
}


resource "aws_instance" "nginx_dev" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = "${aws_subnet.publicnet_nginx_dev.id}"
  key_name = var.keys
  security_groups = [ "${aws_security_group.nginxgr.id}" ]
  user_data = file("nginx.sh")

  connection {
    type = "ssh"
    user        = "${var.ssh_user}"
    private_key = "${file(var.private_key_path)}"
    host = self.public_ip
  }

 provisioner "file" {
    content      = "ipaddressapp: ${aws_instance.application_dev.private_ip}"
    destination = "/home/ubuntu/vars.yml"
  }

  tags = {
    Name = "nginx_dev"
  }
}

resource "aws_instance" "nginx_prod" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = "${aws_subnet.publicnet_nginx_prod.id}"
  key_name = var.keys
  security_groups = [ "${aws_security_group.nginxgr.id}" ]
  user_data = file("nginx.sh")

  connection {
    type = "ssh"
    user        = "${var.ssh_user}"
    private_key = "${file(var.private_key_path)}"
    host = self.public_ip
  }

 provisioner "file" {
    content      = "ipaddressapp: ${aws_instance.application_prod.private_ip}"
    destination = "/home/ubuntu/vars.yml"
  }

  tags = {
    Name = "nginx_prod"
  }
}

