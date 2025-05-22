module "vpc" {
    source = "./VPC"
    vpc_cidr_block = var.vpc_cidr_block
    subnet_cidr_block =  var.subnet_cidr_block
    public_ip =  var.public_ip
    az = var.az
  
}

module "ec2" {
    source = "./EC2"
    ami_id =  var.ami_id
    instance_type =  var.instance_type
    key = var.key
    subnet_id =  module.vpc.subnet_id
    security_group_id = module.vpc.security_group_id
}
