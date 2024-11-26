output "vpc_id" {
  value = aws_vpc.vpc_main.id
}

output "PublicSubnet1_id" {
  value = aws_subnet.FridayHITTPublicSubnet.id
}

output "PrivateSubnet1_id" {
  value = aws_subnet.FridayHITTPrivateSubnet.id
}