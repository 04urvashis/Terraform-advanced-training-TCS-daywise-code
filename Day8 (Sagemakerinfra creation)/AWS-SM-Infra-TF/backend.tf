terraform {
  backend "s3" {
    bucket = "sagemaker-us-east-2-932589472370"
    key = "/terraform.tfstate"
    region = var.region
    dynamodb_table = "locktable"
    encrypt = "true"
  }
}