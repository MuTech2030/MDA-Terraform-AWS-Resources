module "eks_control_plane" {
  source                 = "git@github.com:MuTech2030/MDA-Terraform-AWS-Modules.git//terraform-modules/08-eks"
  eks_iam_role_name      = var.eks_iam_role_name
  eks_control_plane_name = var.eks_control_plane_name
  k8s_version            = "1.30"
  subnet_ids             = local.eks_subnet_ids
  security_group_ids     = local.eks_security_group_ids
  tags                   = var.tags
}
