###########################
# CALL EXAMPLE: ssm.tf
###########################

module "ssm_role" {
  source             = "git@github.com:MuTech2030/MDA-Terraform-AWS-Modules.git//terraform-modules//11-ssm-session-manager"
  instance_role_name = "ec2-ssm-role"
  tags = {
    Environment = "prod"
    Owner       = "DevOps"
    Project     = "aws-identity"
  }
}
