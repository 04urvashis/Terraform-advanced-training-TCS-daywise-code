#Trusted entity - the one who assume the ROLE
data "aws_iam_policy_document" "sagemaker_policy_document" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["sagemaker.amazonaws.com"]
    }
  }
}

# Role for AWS Domain Execution Role in SAGEMAKER
resource "aws_iam_role" "sagemaker_domain_execution_role" {
    name = "sagemaker_domain_execution_role"
    path = "/"
    assume_role_policy = data.aws_iam_policy_document.sagemaker_policy_document.json
 }

resource "aws_iam_role_policy_attachment" "sagemaker_administrator_access" {
  role = aws_iam_role.sagemaker_domain_execution_role.name
  policy_arn = "arn:iam::aws:policy/AdministratorAccess"
  
}


