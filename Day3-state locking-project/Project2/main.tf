provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "urvashi-ec2" {

  ami                         = "ami-007855ac798b5175e"
  instance_type               = "t2.micro"
  count                       = var.instance_count
  associate_public_ip_address = var.enable_public_id
  tags                        = var.project_tags

}
terraform {
   backend "s3" {
     bucket = "urvasho-terraform-s3-bucket"
     key = "urvashi/terraform/remote/s3/terraform.tfstate"
     region = "us-east-1"
     dynamodb_table = "urvashi-dynamo-state-locking"
   }
}

# we use terraform validate to check for the code for any configuration errors/syntax errors before we plan it out.
# terraform fmt --> to format the code
  
  

