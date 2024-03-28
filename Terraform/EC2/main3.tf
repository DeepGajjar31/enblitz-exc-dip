provider "aws" {
  region = var.region
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "example" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.0.0/24"
}

resource "aws_instance" "example" {
  associate_public_ip_address = true
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = "test-ec2"
  subnet_id     = aws_subnet.example.id

  tags = {
    "Name" = "Ec2tfvars"
  }
}

output "public_ip" {
  value = aws_instance.example.public_ip
}

output "private_ip" {
  value = aws_instance.example.private_ip
}