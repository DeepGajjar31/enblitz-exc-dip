variable "ec2_config" {
  default = {
    region        = "ap-south-1"
    instance_type = "t2.micro"
    ami_id        = "ami-007020fd9c84e18c7"
    key_name      = "test-ec2"
    subnet_id     = "subnet-0a3d0dba0aec092eb"
  }
}