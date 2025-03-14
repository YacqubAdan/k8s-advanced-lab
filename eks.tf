module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name                             = local.name
  cluster_version                          = "1.31"
  cluster_endpoint_public_access_cidrs     = ["0.0.0.0/0"] # for testing normally don't do this
  cluster_endpoint_public_access           = true          # for testing normally don't do this
  enable_cluster_creator_admin_permissions = true

  enable_irsa = true

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets # worker nodes
  control_plane_subnet_ids = module.vpc.public_subnets  # control plane

  eks_managed_node_group_defaults = {
    disk_size      = 50
    instance_types = ["t3a.large", "t3.large"]
  }

  eks_managed_node_groups = {
    default = {}
  }

  tags = local.tags
}
