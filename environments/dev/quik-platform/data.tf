data "aws_caller_identity" "current" {}

#######################################
# 07 - Data Source: KMS Key
#######################################
data "aws_kms_key" "mda_root_encryption" {
  key_id = "alias/mda-root-encryption-key"
}

#######################################
# 04 - Data Sources
#######################################
data "aws_availability_zones" "available" {}

data "aws_iam_role" "dev_quik_chat_role" {
  name = "DevQuikPlatformChatRole"
}

data "aws_iam_role" "dev_quik_llm_role" {
  name = "DevQuikPlatformLLMRole"
}

data "aws_iam_role" "devops_team_role" {
  name = "DevOpsTeamRole"
}

data "aws_iam_role" "security_team_role" {
  name = "SecurityTeamRole"
}