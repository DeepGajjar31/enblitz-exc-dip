# Create AWS-Ec2 using main.tf

"provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "new_instance" {
  ami           = "ami-007020fd9c84e18c7"
  key_name      = "win_ec2"
  subnet_id     = "subnet-0d656c4b7c43554af"
  instance_type = "t2.micro"
  tags = {
    "Name" = "newEc2UsingTerrform"
  }

}"

## Using key

## Without key

## Create AWS VPC using main.tf (terraform file)
