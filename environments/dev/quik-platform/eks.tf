module "eks_control_plane" {
  source                 = "git@github.com:MuTech2030/MDA-Terraform-AWS-Modules.git//terraform-modules/08-eks"
  eks_iam_role_name      = var.eks_iam_role_name
  eks_control_plane_name = var.eks_control_plane_name
  k8s_version            = "1.30"
  subnet_ids             = local.eks_subnet_ids
  security_group_ids     = local.eks_security_group_ids
  tags                   = var.tags
   
aws_auth_roles = [
  {
    rolearn  = data.aws_iam_role.dev_quik_chat_role.arn
    username = "devquik_chat"
    groups   = ["system:masters"]
  },
  {
    rolearn  = data.aws_iam_role.dev_quik_llm_role.arn
    username = "devquik_llm"
    groups   = ["poweruser"]
  },
  {
    rolearn  = data.aws_iam_role.devops_team_role.arn
    username = "devops_team"
    groups   = ["system:masters"]
  },
  {
    rolearn  = data.aws_iam_role.security_team_role.arn
    username = "security_team"
    groups   = ["security-audit"]
  }
]
}
