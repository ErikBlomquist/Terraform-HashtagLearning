## PROVIDER
provider "aws" {
    region = "us-west-2"
    profile = "admin-korkbots"
}
module "sg_module" {
  source = "./sg_module"
}

module "ec2_module_1" {
    sg_id = "${module.sg_module.sg_id_output}"
    ec2_name = "EC2 Instance #1 from Module"
    source = "./ec2_module"
}

module "ec2_module_2" {
    sg_id = "${module.sg_module.sg_id_output}"
    ec2_name = "EC2 Instance #2 from Module"
    source = "./ec2_module"
}



