resource "aws_sagemaker_app" "sagemaker_app_1" {
  domain_id         = aws_sagemaker_domain.sagemaker-domain-alfa.id
  user_profile_name = aws_sagemaker_user_profile.aws_sagemaker_user_profile1.user_profile_name
  app_name          = "mlops-app1"
  app_type          = "JupyterServer"
}

resource "aws_sagemaker_app" "sagemaker_app_2" {
  domain_id         = aws_sagemaker_domain.sagemaker-domain-beta.id
  user_profile_name = aws_sagemaker_user_profile.aws_sagemaker_user_profile2.user_profile_name
  app_name          = "mlops-app2"
  app_type          = "JupyterServer"
}





# user_profile_name = aws_sagemaker_user_profile.example.user_profile_name
  