primary_region   = "us-east-1"
secondary_region = "us-west-2"

tags = {
  Environment  = "prod"
  Project      = "aws-tower-root-account"
  BusinessUnit = "Platform-Team"
  Owner        = "DevOps-Team"
  Terraform    = "1"
}

#######################################
# 05 - VPC - Subments
#######################################

vpc_cidr = "10.0.0.0/16"


private_subnets = {
  gpu_nodepool_1 = {
    cidr_block = "10.0.1.0/24"
    name       = "gpu-nodepool-subnet-1"
    az         = "us-east-1a"
  }
  gpu_nodepool_2 = {
    cidr_block = "10.0.2.0/24"
    name       = "gpu-nodepool-subnet-2"
    az         = "us-east-1b"
  }
  apps_nodepool_1 = {
    cidr_block = "10.0.3.0/24"
    name       = "apps-nodepool-subnet-1"
    az         = "us-east-1a"
  }
  apps_nodepool_2 = {
    cidr_block = "10.0.4.0/24"
    name       = "apps-nodepool-subnet-2"
    az         = "us-east-1b"
  }
  rds-a = {
    cidr_block = "10.0.5.0/24"
    name       = "rds-subnet-az1"
    az         = "us-east-1a"
  }
  rds-b = {
    cidr_block = "10.0.11.0/24"
    name       = "rds-subnet-az2"
    az         = "us-east-1b"
  }
  ses = {
    cidr_block = "10.0.6.0/24"
    name       = "ses-subnet"
    az         = "us-east-1c"
  }
  ecr = {
    cidr_block = "10.0.7.0/24"
    name       = "ecr-subnet"
    az         = "us-east-1c"
  }
  ecr = {
    cidr_block = "10.0.12.0/24"
    name       = "ec2-subnet"
    az         = "us-east-1c"
  }
}




#######################################
# 02 -  S3
#######################################
bucket_name_quick_platform_s3 = "s3"
sse_algorithm                 = "aws:kms"
versioning                    = false
mfa_delete                    = false
apply_lifecycle_rules         = false
enable_logging                = false
# log_bucket_name       = "my-log-bucket"
#######################################
# 03 -  RDS
#######################################
allocated_storage   = 20
engine              = "postgres"
engine_version      = "17.2"
instance_class      = "db.t3.medium"
db_name             = "mydb"
username            = "muadmin"
password            = "xxxxxddd" # managed externally, keep empty or set here
skip_final_snapshot = true
publicly_accessible = false

aws_db_subnet_group_name = "quik-platform-rds-subnet-group"

vpc_security_group_ids = [] # passed from module, not hardcoded



#######################################
# 03 -  SG
#######################################
vpc_id = "vpc-0abc123456def7890"

ingress_rules = [
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH"
  }
]

egress_rules = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all egress"
  }
]


### EKS
eks_iam_role_name      = "mda-dev-quik-platform-eks-cluster-role"
eks_control_plane_name = "mda-quik-platform-eks-control-plane"
worker_policy_arns = [
  "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
  "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
  "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
]