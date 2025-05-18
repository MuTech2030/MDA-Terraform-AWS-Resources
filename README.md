# MDA-Terraform-AWS-Resources
This is to demo EKS based Solution in AWS with Terraform, Go, React, Python, DevSecOps Tools
Authentincation -> Solution -> Pipeline -> DevSecOps -> Active/Active Set Up
# 🔹 Region 1 (Primary) Plan
1. Init Provider – Define default AWS provider for Region 1 (provider "aws" { region = "us-east-1" }) & Region 2 for Aurora 
2. KMS Setup – Create KMS managed key by portal - for S3, RDS, Secrets
3. Init Backend – Configure remote state: S3 bucket + DynamoDB (encrypted using KMS) & Accounts Roles
4. # Apply and fix & ensure proper configuration
5. VPC Setup – Public/private subnets, NAT, IGW 
 # Doing the Infra CIDR Plan #
6. Secrets Manager – Store sensitive app configs (encrypted with KMS - do it by portal to not expose it in the statefile)

7. S3 Bucket – Encrypted app storage
8. EKS Cluster – Multi-node cluster + IAM roles
9. SES Setup – Email sending config (region-specific)
10. Aurora PostgreSQL Primary – Primary Aurora DB
11. Route 53 – Global hosted zone setup
12. better by kustomize/helm : ArgoCD/CI/CD – GitOps agents 
13. Github Action Terraform pipelines

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