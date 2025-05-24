#Instruction as a Code with Terraform to create VPC in AWS.

#step 1: Configure the cloud service provider 

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#-->Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
}

#step 2: create vpc
resource "aws_vpc" "myvpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "devops_vpc"
  }
}



#step 3: create public subnet
resource "aws_subnet" "publicSubnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "devops_public_subnet"
  }
}

#step 4: create internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "devops_igw"
  }
}


#step 6: create route table 
resource "aws_route_table" "publicRT" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "devops_publicRT"
  }
}

#step7: connect public subnet to public route table (Subnet Association)
resource "aws_route_table_association" "subnetAss" {
  subnet_id      = aws_subnet.publicSubnet.id
  route_table_id = aws_route_table.publicRT.id
}

