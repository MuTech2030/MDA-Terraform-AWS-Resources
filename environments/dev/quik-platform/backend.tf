#######################################
# 01 - Providers for Multi-Region Setup
#######################################
provider "aws" {
  region = var.primary_region
  /*
assume_role {
  role_arn = "arn:aws:iam::533267417258:role/TowerAssumeRole"
}
  */
}

provider "aws" {
  alias  = "secondary"
  region = var.secondary_region
  /*
assume_role {
  role_arn = "arn:aws:iam::533267417258:role/TowerAssumeRole"
}
  */
}

#########################################
# 02 - Required Providers with Constraints
#########################################
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.95.0"
    }
  }
}

###################################################
# 03 - Remote Backend (S3 + DynamoDB) - Primary Only
###################################################

terraform {
  backend "s3" {
    bucket         = "mda-tf-backend-primary"
    key            = "mda/env/dev/quik-platform/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "mda-tf-lock-primary"
    encrypt        = true
  }
}


##########################
# 05 - Local Configuration
##########################

locals {
  prefix                   = "mda-quik-platform"
  region                   = var.primary_region
  tags                     = var.tags
  actual_quick_platform_s3 = join("-", [local.prefix, var.bucket_name_quick_platform_s3, local.region])
}