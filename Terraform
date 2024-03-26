## Create AWS-Ec2
# Using key

provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "new_instance" {
  ami           = "ami-007020fd9c84e18c7"
  key_name      = "test-ec2"
  subnet_id     = "subnet-0d656c4b7c43554af"
  instance_type = "t2.micro"
  tags = {
    "Name" = "newEc2UsingTerrform"
  }
}

# Without key

provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "my_instance" {
  ami           = "ami-007020fd9c84e18c7"
  subnet_id     = "subnet-0d656c4b7c43554af"
  instance_type = "t2.micro"
  tags = {
    "Name" = "MyEc2UsingTerrform"
  }
}

## Create AWS VPC using main.tf (terraform file)

provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "my_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "MyVPC"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a"
  tags = {
    Name = "PublicSubnet1"
  }
}
