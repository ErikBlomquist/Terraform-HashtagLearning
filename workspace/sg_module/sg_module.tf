
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

variable "sg_name" {}


## SG
resource "aws_security_group" "korkbots_ec2_sg" {
    name        = "${var.sg_name}"
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

output "sg_id_output" {
  value = "${aws_security_group.korkbots_ec2_sg.id}"
}
