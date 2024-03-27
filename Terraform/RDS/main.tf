provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "example_az1" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "TerraformExampleAz1"
  }
}

resource "aws_subnet" "example_az2" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "TerraformExampleAz2"
  }
}

resource "aws_db_subnet_group" "example" {
  name        = "terraform-example-db-subnet-group"
  subnet_ids  = [aws_subnet.example_az1.id, aws_subnet.example_az2.id]

  tags = {
    Name = "terraform-example-db-subnet-group"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  identifier           = "mydatabase"
  username             = "myusername"
  password             = "mypassword"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.example.name
}