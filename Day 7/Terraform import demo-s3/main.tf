provider "aws" {
  region = "us-east-1"
}


resource "aws_s3_bucket" "urvashi-bucket" {
    bucket = "urvashi-bucket"
    tags = {
    Name = "urvashi-terraform-bucket-s3"
  }
  
}

resource "aws_s3_bucket_acl" "example" {
    bucket = "urvashi-bucket"
    #acl    = "public"
  
}