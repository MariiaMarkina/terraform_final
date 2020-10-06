resource "aws_security_group" "nginxgr" {
  name        = "nginxgr"
  description = "Allow traffic for nginx and SSH"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "allow http traffic on port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow ssh traffic on port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]              
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nginxgr"
  }
}





resource "aws_security_group" "applicationgr" {
  name        = "applicationgr"
  description = "Allow traffic for port,on which tomcat works, and SSH"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "allow traffic on port 8070"
    from_port   = 8070
    to_port     = 8070
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow ssh traffic on port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]              
  }

    #ingress {
    #description = "allow traffic on port 8080"
    #from_port   = 8080  
    #to_port     = 8080  
    #protocol    = "tcp"
    #cidr_blocks = ["0.0.0.0/0"]
  #}

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "applicationgr"
  }
}






resource "aws_security_group" "jenkinsgr" {
  name        = "jenkinsgr"
  description = "Allow traffic for jenkins, http traffic and SSH"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "allow http traffic on port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    description = "allow ssh traffic on port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]              
  }

  ingress {
    description = "allow traffic on port 8080"
    from_port   = 8080  
    to_port     = 8080  
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkinsgr"
  }
}
