provider "aws" {
  region = "us-east-1"
}

# terraform import aws_instance.terraform-urvashi i-0af646be6629bbb25


resource "aws_instance" "terraform-urvashi" {
  ami           = "ami-007855ac798b5175e"
  instance_type = "t2.micro"
  tags = {
    "Name" = "urvashi-terraform-instance"
  }
}