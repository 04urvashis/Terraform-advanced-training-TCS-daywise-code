resource "aws_vpc" "sagemaker-vpc-urvashi" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "sagemaker-vpc-urvashi"
  }
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
}