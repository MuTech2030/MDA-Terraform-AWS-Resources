#######################################
# 01 - Module Call for VPC
#######################################
module "vpc" {
  source          = "git@github.com:MuTech2030/MDA-Terraform-AWS-Modules.git//terraform-modules/03-vpc"
  vpc_cidr        = var.vpc_cidr
  tags            = var.tags
  private_subnets = var.private_subnets
}



#######################################
# 01 - Module Call for S3
#######################################
module "quick-platform-s3" {
  source = "git@github.com:MuTech2030/MDA-Terraform-AWS-Modules.git//terraform-modules/07-s3"

  bucket_name           = local.actual_quick_platform_s3
  tags                  = var.tags
  sse_algorithm         = var.sse_algorithm
  kms_key_id            = data.aws_kms_key.mda_root_encryption.arn
  bucket_policy         = var.bucket_policy
  versioning            = var.versioning
  mfa_delete            = var.mfa_delete
  apply_lifecycle_rules = var.apply_lifecycle_rules
  enable_logging        = var.enable_logging
  log_bucket_name       = var.log_bucket_name
}

#######################################
# 04 - Postgress RDS
#######################################

module "postgres" {
  source                      = "git@github.com:MuTech2030/MDA-Terraform-AWS-Modules.git//terraform-modules/06-rds-postgresql"
  allocated_storage           = var.allocated_storage
  engine                      = var.engine
  engine_version              = var.engine_version
  instance_class              = var.instance_class
  db_name                     = var.db_name
  username                    = var.username
  password                    = var.password
  skip_final_snapshot         = var.skip_final_snapshot
  publicly_accessible         = var.publicly_accessible
  aws_db_subnet_group_name    = var.aws_db_subnet_group_name
  aws_db_subnet_group_name_id = local.rds_subnet_names
  vpc_security_group_ids      = [module.my_security_group.security_group_id]
  tags                        = var.tags
}
locals {
  rds_subnet_names = [
    module.vpc.private_subnet_ids_with_names["rds-subnet-az1"],
    module.vpc.private_subnet_ids_with_names["rds-subnet-az2"]
  ]
  eks_subnet_ids = [
    module.vpc.private_subnet_ids_with_names["apps-nodepool-subnet-1"],
    module.vpc.private_subnet_ids_with_names["apps-nodepool-subnet-2"]
  ]
  eks_security_group_ids = [module.my_security_group.security_group_id]
  gpu_node_group_subnet  = [module.vpc.private_subnet_ids_with_names["apps-nodepool-subnet-1"]]
  apps_node_group_subnet = [module.vpc.private_subnet_ids_with_names["apps-nodepool-subnet-2"]]

  # eks_iam_role_arn =[module.eks_control_plane.role_arn]
}


#######################################
# 05 - AWS SG 
#######################################
module "my_security_group" {
  source = "git@github.com:MuTech2030/MDA-Terraform-AWS-Modules.git//terraform-modules/13-sg"

  vpc_id = module.vpc.vpc_id
  tags   = var.tags

  ingress_rules = var.ingress_rules
  egress_rules  = var.egress_rules
}
