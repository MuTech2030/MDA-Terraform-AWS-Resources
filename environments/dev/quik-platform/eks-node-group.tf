

module "gpu_node_group" {
  source          = "git@github.com:MuTech2030/MDA-Terraform-AWS-Modules.git//terraform-modules/09-eks-node-group"
  cluster_name    = var.eks_control_plane_name
  node_group_name = "gpu-workers"
  node_role_name  = "gpu-node-role"
  subnet_ids      = local.gpu_node_group_subnet
  desired_size    = 2
  max_size        = 4
  min_size        = 1
  instance_types  = ["g4dn.xlarge"]
  policy_arns     = var.worker_policy_arns
  tags            = var.tags
}