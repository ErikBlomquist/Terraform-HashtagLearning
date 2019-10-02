/*
1.
terraform workspace new staging
terraform workspace new production

2. 
terraform workspace lists

3.
terraform init
terraform plan
terraform apply

*/

## PROVIDER
provider "aws" {
    region = "us-west-2"
    profile = "admin-korkbots"
}
module "sg_module" {
    sg_name = "sg_ec2_${local.env}"
    source = "./sg_module"
}

module "ec2_module_1" {
    sg_id = "${module.sg_module.sg_id_output}"
    ec2_name = "EC2_Instance_${local.env}"
    source = "./ec2_module"
}

# module "ec2_module_2" {
#     sg_id = "${module.sg_module.sg_id_output}"
#     ec2_name = "EC2_Instance_${local.env}_#2"
#     source = "./ec2_module"
# }

locals {
    env = "${terraform.workspace}"
}
