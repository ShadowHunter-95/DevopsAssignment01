terraform {
  backend "s3" {
    bucket = "fridayhittbucketj"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
}


module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  FridayHITTPublicSubnet_cidr_block = var.FridayHITTPublicSubnet_cidr_block
  FridayHITTPrivateSubnet_cidr_block = var.FridayHITTPrivateSubnet_cidr_block
}

module "ec2" {
  source = "./modules/ec2"
  ami_id = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  subidpriv = module.vpc.PrivateSubnet1_id
  subidpub = module.vpc.PublicSubnet1_id
  vpc_id = module.vpc.vpc_id
}