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

variable "subidpriv" {
  description = "The private subnet ID"
  type        = string
}

variable "subidpub" {
  description = "The public subnet ID"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}