provider "aws" {
  region = "us-east-1"
}
module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.8.2"
  bucket = "my-s3-bucket-urvashi"
  acl    = "private"
  versioning = {
  enabled = true
  }

}
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  for_each = toset(["one", "two", "three"])

  name = "instance-${each.key}"

  ami                    = "ami-007855ac798b5175e"
  instance_type          = "t2.micro"
  key_name               = "urvi_KeyPair_pem"
  monitoring             = true
 

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

