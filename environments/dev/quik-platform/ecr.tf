module "app_ecr" {
  source = "git@github.com:MuTech2030/MDA-Terraform-AWS-Modules.git//terraform-modules/11-ecr"

  name                 = "myapp"
  image_tag_mutability = "IMMUTABLE"
  scan_on_push         = true
  encryption_type      = "AES256"

  tags = {
    Project     = "quik-platform"
    Environment = "dev"
    Owner       = "DevOps"
    Terraform   = "true"
  }
}
