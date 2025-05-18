# MDA-Terraform-AWS-Resources
This is to demo EKS based Solution in AWS with Terraform, Go, React, Python, DevSecOps Tools

# 🔹 Region 1 (Primary) Plan
Init Provider – Define default AWS provider for Region 1 (provider "aws" { region = "us-east-1" })

KMS Setup – Create KMS keys for S3, RDS, Secrets

Init Backend – Configure remote state: S3 bucket + DynamoDB (encrypted using KMS)

VPC Setup – Public/private subnets, NAT, IGW

Secrets Manager – Store sensitive app configs (encrypted with KMS)

Aurora PostgreSQL Primary – Primary Aurora DB

S3 Bucket – Encrypted app storage

EKS Cluster – Multi-node cluster + IAM roles

SES Setup – Email sending config (region-specific)

Route 53 – Global hosted zone setup

ArgoCD/CI/CD – GitOps agents and pipelines

App Deployment – React frontend, Go backend

# 🔹 Region 2 (Secondary) Plan
Init Provider – Define secondary region using alias (e.g., provider "aws" { alias = "eu" region = "eu-central-1" })

KMS Setup – Create region-specific KMS keys

Init Backend – Set up separate S3 + DynamoDB backend for this region

VPC Setup – Networking in Region 2

Secrets Manager – Replicate/create secrets with encryption

Aurora Read Replica – Cross-region read replica

S3 Bucket with Replication – Set replication from Region 1

EKS Cluster – Same setup as Region 1

Route 53 Update – Add latency/failover routing

ArgoCD/CI/CD – Deploy GitOps agent in Region 2

Load Balancer/WAF – Global access, region routing

App Deployment – Same apps deployed