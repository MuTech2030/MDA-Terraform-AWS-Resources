data "aws_caller_identity" "current" {}

#######################################
# 07 - Data Source: KMS Key
#######################################
data "aws_kms_key" "mda_root_encryption" {
  key_id = "alias/mda-root-encryption-key"
}
