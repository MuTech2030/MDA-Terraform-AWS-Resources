#######################################
# 01 - Module Call for VPC
#######################################
module "vpc" {
  source = "git@github.com:MuTech2030/MDA-Terraform-AWS-Modules.git//terraform-modules/03-vpc"
  vpc_cidr           = var.vpc_cidr
  name_prefix        = var.name_prefix
  private_subnet_map = var.private_subnet_map
  tags               = var.tags
}

