data "aws_availability_zones" "available_zones" {
    state = "available"
}

resource "aws_vpc" "vpc_main" {
    cidr_block = var.vpc_cidr
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        Name = "ec2_vpc"
    }
}

resource "aws_subnet" "FridayHITTPublicSubnet" {
    vpc_id = aws_vpc.vpc_main.id
    cidr_block = var.FridayHITTPublicSubnet_cidr_block
    availability_zone = data.aws_availability_zones.available_zones.names[0]
    map_public_ip_on_launch = true
    tags = {
        Name = "FridayHITTPublicSubnet"
    }
}

resource "aws_subnet" "FridayHITTPrivateSubnet" {
    vpc_id = aws_vpc.vpc_main.id
    cidr_block = var.FridayHITTPrivateSubnet_cidr_block
    availability_zone = data.aws_availability_zones.available_zones.names[0]
    map_public_ip_on_launch = false
    tags = {
        Name = "FridayHITTPrivateSubnet"
    }
}

resource "aws_internet_gateway" "FridayHITTInternetGateway" {
    vpc_id = aws_vpc.vpc_main.id
    tags = {
        Name = "ec2_igw"
    }
}

resource "aws_route_table" "FridayHITTPublicRouteTable" {
    vpc_id = aws_vpc.vpc_main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.FridayHITTInternetGateway.id
}
}

resource "aws_route_table_association" "FridayHITTPublicSubnetRouteTableAssociation" {
    subnet_id = aws_subnet.FridayHITTPublicSubnet.id
    route_table_id = aws_route_table.FridayHITTPublicRouteTable.id
}

resource "aws_route_table" "FridayHITTPrivateRouteTable" {
    vpc_id = aws_vpc.vpc_main.id
}

resource "aws_route_table_association" "FridayHITTPrivateSubnetRouteTableAssociation" {
    subnet_id = aws_subnet.FridayHITTPrivateSubnet.id
    route_table_id = aws_route_table.FridayHITTPrivateRouteTable.id
}