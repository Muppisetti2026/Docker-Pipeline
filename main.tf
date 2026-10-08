provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "docker_ec2" {
  ami           = "ami-01e082ac2f79f3918" # Amazon Linux 2 AMI
  instance_type = "t3.micro"
  key_name      = "EC2-Default"

  tags = {
    Name ="Docker EC2"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras enable docker
              yum install -y docker
              service docker start
              usermod -aG docker ec2-user
              EOF
}
