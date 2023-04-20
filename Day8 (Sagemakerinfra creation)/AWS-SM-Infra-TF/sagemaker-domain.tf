resource "aws_sagemaker_domain" "sagemaker-domain-alfa" {
  domain_name = "sagemaker-domain-alfa"
  auth_mode   = "IAM"
  vpc_id      = aws_vpc.sagemaker-vpc-urvashi
  subnet_ids  = [aws_subnet.zonea-public-subnet.id, aws_subnet.zoneb-public.subnet.id]
   #subnet_ids  = [aws_subnet.zonea-private-subnet.id, aws_subnet.zoneb-private.subnet.id]

  default_user_settings {
    #execution_role = aws_iam_role.example.arn
    execution_role = aws_iam_role.sagemaker_domain_execution_role.arn
  }

  default_space_settings {
    execution_role = aws_iam_role.sagemaker_domain_execution_role.arn
  }
}

resource "aws_sagemaker_domain" "sagemaker-domain-beta" {
  domain_name = "sagemaker-domain-beta"
  auth_mode   = "IAM"
  vpc_id      = aws_vpc.sagemaker-vpc-urvashi
  #subnet_ids  = [aws_subnet.zonea-public-subnet.id, aws_subnet.zoneb-public.subnet.id]
   subnet_ids  = [aws_subnet.zonea-private-subnet.id, aws_subnet.zoneb-private.subnet.id]

  default_user_settings {
    #execution_role = aws_iam_role.example.arn
    execution_role = aws_iam_role.sagemaker_domain_execution_role.arn
  }

  default_space_settings {
    execution_role = aws_iam_role.sagemaker_domain_execution_role.arn
  }
}