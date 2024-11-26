variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "FridayHITTPublicSubnet_cidr_block" {
  description = "The CIDR block for the public subnet"
  type        = string
}

variable "FridayHITTPrivateSubnet_cidr_block" {
  description = "The CIDR block for the private subnet"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "The key name for the EC2 instance"
  type        = string
}

variable "region" {
  description = "The region in which the resources will be created"
  type        = string
}

variable "access_key" {
  description = "The access key for the AWS account"
  type        = string
}

variable "secret_key" {
  description = "The secret key for the AWS account"
  type        = string
}