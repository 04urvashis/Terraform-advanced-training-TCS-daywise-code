resource "aws_s3_bucket" "urvashi_lambda_bucket" {
  bucket = "lambda-urvashi-bucket-demo"
  force_destroy = true
}

#resource "aws_s3_bucket_public_access_block" "urvashi_lambda_bucket" {
   # bucket = "lambda-urvashi-bucket-demo"

    #block_public_acls = true
    #block_public_policy = true
    #ignore_public_acls = true
    #restrict_public_buckets = true
#}