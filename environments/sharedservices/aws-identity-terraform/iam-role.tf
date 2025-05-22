
# --------------------------
# shared data for calls
# --------------------------
# data "aws_caller_identity" "current" {}

#########################################
# Call 1: DevOps Team (admin access)
#########################################
# devops/main.tf
module "iam_role_devops" {
  source      = "git@github.com:MuTech2030/MDA-Terraform-AWS-Modules.git//terraform-modules/01-iam"
  name        = "DevOpsTeamRole"
  policy_arns = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  tags = {
    team = "devops"
  }
}

# devops/variables.tf — (optional, no variables used here)

# devops/output.tf
output "devops_role_arn" {
  value = module.iam_role_devops.role_arn
}

# devops/terraform.tfvars — (not needed if using hardcoded values)

#########################################
# Call 2: Security Team (read-only)
#########################################
# security/main.tf
module "iam_role_security" {
  source      = "git@github.com:MuTech2030/MDA-Terraform-AWS-Modules.git//terraform-modules/01-iam"
  name        = "SecurityTeamRole"
  policy_arns = ["arn:aws:iam::aws:policy/SecurityAudit"]
  tags = {
    team = "security"
  }
}
# https://www.linkedin.com/in/michelebertasi/
# security/output.tf
output "security_role_arn" {
  value = module.iam_role_security.role_arn
}

#########################################
# Call 3: Developer Quik Chat (admin in dev)
#########################################
# dev_quik_chat/main.tf
module "iam_role_dev_quik_chat" {
  source      = "git@github.com:MuTech2030/MDA-Terraform-AWS-Modules.git//terraform-modules/01-iam"
  name        = "DevQuikPlatformChatRole"
  policy_arns = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  tags = {
    project = "quik-platform-chat"
    env     = "dev"
  }
}

# dev_quik_chat/output.tf
output "dev_quik_chat_role_arn" {
  value = module.iam_role_dev_quik_chat.role_arn
}

#########################################
# Call 4: Developer Quik LLM (contributor access)
#########################################
# dev_quik_llm/main.tf
module "iam_role_dev_quik_llm" {
  source      = "git@github.com:MuTech2030/MDA-Terraform-AWS-Modules.git//terraform-modules/01-iam"
  name        = "DevQuikPlatformLLMRole"
  policy_arns = ["arn:aws:iam::aws:policy/PowerUserAccess"]
  tags = {
    project = "quik-platform-LLM"
    env     = "dev"
  }
}

# dev_quik_llm/output.tf
output "dev_quik_llm_role_arn" {
  value = module.iam_role_dev_quik_llm.role_arn
}
