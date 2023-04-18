 provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "nishant-ec2-deployment" {
  ami                         = "ami-007855ac798b5175e"
  instance_type               = "t2.micro"
  count                       = var.instance_count
  associate_public_ip_address = var.enable_public_id
  tags                        = var.project_tags
}
variable "instance_count" {
  type    = number
  default = 1
}
variable "enable_public_id" {
  type    = bool
  default = true
}
variable "project_tags" {
  type = map(string)
  default = {
    "Name"       = "ec2-instance-nishant-no2"
    "project"    = "project-beta"
    "enviroment" = "dev"
  }