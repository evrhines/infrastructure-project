module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_version = var.eks_version
  cluster_name    = var.eks_name
  vpc_id          = var.vpc_id
  subnets         = var.subnets

  worker_groups = [
    {
      instance_type = var.worker_instance_type
      asg_max_size  = var.num_workers
    }
  ]

  tags = {
    terraform   = "true"
    owner       = "SRE"
    contact     = "evrhiness@gmail.com"
    environment = var.env
  }
}