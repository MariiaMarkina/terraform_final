resource "aws_subnet" "publicnet_jenkins" {
  vpc_id     = data.aws_vpc.default.id
  cidr_block = "172.31.1.0/24"
  availability_zone = var.az
  map_public_ip_on_launch = true
  tags = {
    Name = "publicnet_jenkins"
  }
}

resource "aws_subnet" "publicnet_app_dev" {
  vpc_id     = data.aws_vpc.default.id
  cidr_block = "172.31.2.0/24"
  availability_zone = var.az
  map_public_ip_on_launch = true
  tags = {
    Name = "publicnet_app_dev"
  }
}
  

resource "aws_subnet" "publicnet_app_prod" {
  vpc_id     = data.aws_vpc.default.id
  cidr_block = "172.31.3.0/24"
  availability_zone = var.az
  map_public_ip_on_launch = true
  tags = {
    Name = "publicnet_app_prod"
  }
}

resource "aws_subnet" "publicnet_nginx_dev" {
  vpc_id     = data.aws_vpc.default.id
  cidr_block = "172.31.4.0/24"
  availability_zone = var.az
  map_public_ip_on_launch = true
  tags = {
    Name = "publicnet_nginx_dev"
  }
}

resource "aws_subnet" "publicnet_nginx_prod" {
  vpc_id     = data.aws_vpc.default.id
  cidr_block = "172.31.5.0/24"
  availability_zone = var.az
  map_public_ip_on_launch = true
  tags = {
    Name = "publicnet_nginx_prod"
  }
}


#resource "aws_subnet" "privatenet1" {
#  vpc_id     = var.vpc_id 
#  cidr_block = "172.31.2.0/24"
#  availability_zone = var.az2
#  map_public_ip_on_launch = false

#  tags = {
#    Name = "privatenet1"
#  }
#}  

