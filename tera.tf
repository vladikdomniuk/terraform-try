provider "aws" {}

resource "aws_instance" "my_Amazon" {
    ami = "ami-030e490c34394591b"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.my_webserver.id]
    key_name = "terraform-myweb-keypair"
    user_data = <<EOF
#! /bin/bash
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>Hello world</h1>" | sudo tee /var/www/html/index.html
EOF
}

resource "aws_security_group" "my_webserver" {
  name        = "WebServer Security Group"
  description = "My Security Group"

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
   ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
resource "aws_s3_bucket" "myBucket" {
  bucket = "s3-terraform-bucket"
  acl    = "private"  
  tags = {
    Name        = "My bucket"
  }
  versioning{
    enable = true
  }
}
