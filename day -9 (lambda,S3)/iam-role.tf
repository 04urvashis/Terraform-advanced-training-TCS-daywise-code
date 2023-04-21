resource "aws_iam_role" "lambda_exec_urvashi" {
  name = "hello-lambda-urvashi"

  assume_role_policy = <<POLICY
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": {
                    "Service": "lambda.amazonaws.com"
                },
                "Action": "sts:AssumeRole"
            }
        ]
    }
    POLICY
}

resource "aws_iam_role_policy_attachment" "lambda_exec_urvashi" {
    role = aws_iam_role.lambda_exec_urvashi.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
resource "aws_lambda_function" "hello_urvashi_function" {
    function_name = "Urvashi-lambda-function"

    s3_bucket = aws_s3_bucket.urvashi_lambda_bucket.id
    s3_key = aws_s3_object.lambda_hello.key

    runtime = "nodejs16.x"
    handler = "function.handler"

    source_code_hash = data.archive_file.lambda_hello.output_base64sha256

    role = aws_iam_role.lambda_exec_urvashi.arn
}

resource "aws_cloudwatch_log_group" "urvashi-logs" {
    name = "/aws/lambda/${aws_lambda_function.hello_urvashi_function.function_name}"
    retention_in_days = 14
  
}


data "archive_file" "lambda_hello" {
    type = "zip"
    source_dir = "input-file"
    output_path = "output-zip/function.zip"
}

resource "aws_s3_object" "lambda_hello" {
    bucket = aws_s3_bucket.urvashi_lambda_bucket.id
    key = "function.zip"
    source = data.archive_file.lambda_hello.output_path
    etag = filemd5(data.archive_file.lambda_hello.output_path)
}