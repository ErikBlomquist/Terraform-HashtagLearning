## PROVIDER
provider "aws" {
    region = "us-west-2"
    profile = "admin-korkbots"
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

## SG
resource "aws_security_group" "korkbots_ec2_sg" {
    name        = "korkbots_ec2_sg"
    description = "Allow all inbound traffic for ec2 instance"
    vpc_id      = "${aws_default_vpc.default.id}" # default vpc

    ingress { # allow SSH inbound
        from_port       = 22
        to_port         = 22
        protocol        = "TCP"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    egress {
        from_port       = 22
        to_port         = 22
        protocol        = "TCP"
        cidr_blocks     = ["0.0.0.0/0"]
    }
}

## EC2
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami             = "${data.aws_ami.ubuntu.id}"
  instance_type   = "t2.micro"
  key_name        = "korkbots"
  vpc_security_group_ids = ["${aws_security_group.korkbots_ec2_sg.id}"]

  tags = {
    Name = "HelloWorld"
  }
}

