output "public_ip" {
  value = aws_instance.FridayHITTPublicEC2Instance.public_ip
  description = "Public IP of the EC2 instance"
}

output "public_sg" {
  value = aws_security_group.FridayHITTPublicEC2InstanceSecurityGroup.id
  description = "Security group ID of the public EC2 instance"
}

output "private_sg" {
  value = aws_security_group.FridayHITTPrivateEC2InstanceSecurityGroup.id
  description = "Security group ID of the private EC2 instance"
}

output "jumpbox_sg" {
  value = aws_security_group.FridayHITTJumpBoxEC2InstanceSecurityGroup.id
  description = "Security group ID of the jumpbox EC2 instance"
}