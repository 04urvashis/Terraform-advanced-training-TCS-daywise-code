resource "aws_sagemaker_user_profile" "aws_sagemaker_user_profile1" {
  #domain_id         = aws_sagemaker_domain.test.id
  domain_id = aws_sagemaker_domain.sagemaker-domain-alfa.id
  user_profile_name = "mldev-user1"
  user_settings {
    execution_role = aws_iam_role.sagemaker_domain_execution_role.arn
  }
}

resource "aws_sagemaker_user_profile" "aws_sagemaker_user_profile2" {
  domain_id = aws_sagemaker_domain.sagemaker-domain-beta.id
  user_profile_name = "mlops-user2"
  user_settings {
    execution_role = aws_iam_role.sagemaker_domain_execution_role.arn
  }
}

