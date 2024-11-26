variable "vpc_cidr" {
}

variable "FridayHITTPublicSubnet_cidr_block" {
  description = "The CIDR block for the public subnet"
  type        = string
}

variable "FridayHITTPrivateSubnet_cidr_block" {
  description = "The CIDR block for the private subnet"
  type        = string
}
