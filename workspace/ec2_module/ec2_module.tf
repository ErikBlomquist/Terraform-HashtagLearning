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

variable "sg_id" {}
variable "ec2_name" {}


resource "aws_instance" "web" {
  ami             = "${data.aws_ami.ubuntu.id}"
  instance_type   = "t2.micro"
  key_name        = "korkbots"
  vpc_security_group_ids = ["${var.sg_id}"]

  tags = {
    Name = "${var.ec2_name}"
  }
}

