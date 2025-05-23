module "cluster_autoscaler_wi" {
  source              = "git@github.com:MuTech2030/MDA-Terraform-AWS-Modules.git//terraform-modules/10-workload-identity"
  cluster_name        = var.eks_control_plane_name
  role_name           = "cluster-autoscaler-role"
  k8s_namespace       = "kube-system"
  k8s_service_account = "cluster-autoscaler"
  policy_arns = [
    "arn:aws:iam::aws:policy/AmazonEKSClusterAutoscalerPolicy"
  ]
  thumbprint                   = "9e99a48a9960b14926bb7f3b02e22da0afd6e3bb"
  tags                         = var.tags
  depends_on = [
    module.eks_control_plane
  ]


}
