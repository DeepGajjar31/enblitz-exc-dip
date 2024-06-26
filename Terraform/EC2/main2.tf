provider "aws" {
  region = var.ec2_config["region"]
}

resource "aws_instance" "example" {
  ami           = var.ec2_config["ami_id"]
  instance_type = var.ec2_config["instance_type"]
  key_name      = var.ec2_config["key_name"]
  subnet_id     = var.ec2_config["subnet_id"]
  associate_public_ip_address = true

  tags = {
    Name = "TerraformEc2"
  }
}

output "public_ip" {
  value = aws_instance.example.public_ip
}

output "private_ip" {
  value = aws_instance.example.private_ip
}
