terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-1"
}

# Create a VPC
resource "aws_vpc" "or" {
  cidr_block = "192.128.1.0/24"
  tags = {
    "Name"="or"
  }
}

# Subnet web
resource "aws_subnet" "subnet_web" {
  vpc_id = aws_vpc.or.id
  cidr_block = "192.128.1.0/27"
  tags = {
    "Name"="subnet_web"
  }
}

# Subnet app
resource "aws_subnet" "subnet_app" {
  vpc_id = aws_vpc.or.id
  cidr_block = "192.128.1.32/27"
  tags = {
    "Name"="subnet_app"
  }
}

# Subnet db
resource "aws_subnet" "subnet_db" {
  vpc_id = aws_vpc.or.id
  cidr_block = "192.128.1.64/28"
  tags = {
    "Name"="subnet_db"
  }
}