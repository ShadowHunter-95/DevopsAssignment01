#creating Public ec2 instances in terraform
resource "aws_instance" "FridayHITTPublicEC2Instance" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = var.subidpub
    vpc_security_group_ids = [aws_security_group.FridayHITTPublicEC2InstanceSecurityGroup.id]
    tags = {
        Name = "FridayHITTPublicEC2Instance"
    }
  
}
#Private ec2 instance creation
resource "aws_instance" "FridayHITTPrivateEC2Instance" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = var.subidpriv
    vpc_security_group_ids = [aws_security_group.FridayHITTPrivateEC2InstanceSecurityGroup.id]
    tags = {
        Name = "FridayHITTPrivateEC2Instance"
    }
  
}
#Jumpbox ec2 instance creation
resource "aws_instance" "FridayHITTJumpBoxEC2Instance" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = var.subidpub
    vpc_security_group_ids = [aws_security_group.FridayHITTJumpBoxEC2InstanceSecurityGroup.id]
    tags = {
        Name = "FridayHITTJumpBoxEC2Instance"
    }
  
}

#creating security group for public ec2 instance
resource "aws_security_group" "FridayHITTPublicEC2InstanceSecurityGroup" {
    name = "FridayHITTPublicEC2InstanceSecurityGroup"
    vpc_id = var.vpc_id
    #traffic for public ec2 instance http
    ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
    }
    #traffic for public ec2 instance https
    ingress {
    from_port = 443
    protocol = "tcp"
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]
    }
    #traffic for public ec2 instance ssh via jumpbox
    ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    security_groups = [aws_security_group.FridayHITTJumpBoxEC2InstanceSecurityGroup.id]
    }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#creating security group for private ec2 instance
resource "aws_security_group" "FridayHITTPrivateEC2InstanceSecurityGroup" {
    name = "FridayHITTPrivateEC2InstanceSecurityGroup"
    vpc_id = var.vpc_id

    #traffic for private ec2 instance ssh via jumpbox
    ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    security_groups = [aws_security_group.FridayHITTJumpBoxEC2InstanceSecurityGroup.id]
    }
}
#creating security group for jumpbox ec2 instance
resource "aws_security_group" "FridayHITTJumpBoxEC2InstanceSecurityGroup" {
    name = "FridayHITTJumpBoxEC2InstanceSecurityGroup"
    vpc_id = var.vpc_id
    #traffic for jumpbox ec2 instance ssh
    ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
   }
   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}




