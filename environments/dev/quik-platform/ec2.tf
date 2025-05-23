data "aws_iam_instance_profile" "ssm_profile" {
  name = "ec2-ssm-role-profile" # from your SSM module output
}

module "ec2_example" {
  source                    = "git@github.com:MuTech2030/MDA-Terraform-AWS-Modules.git//terraform-modules//14-ec2"
  ami_id                    = "ami-0abcdef1234567890" # put your AMI here
  instance_type             = "t3.micro"
  subnet_id                 = local.ec2_subnet_id
  iam_instance_profile_name = data.aws_iam_instance_profile.ssm_profile.name

  tags = local.tags
}
