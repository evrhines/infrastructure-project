module "eks" {
  source          = "terraform-aws-modules/eks/aws"

  cluster_version = "1.21"
  cluster_name    = "my-cluster"
  vpc_id          = "vpc-1234556abcdef"
  subnets         = ["subnet-abcde012", "subnet-bcde012a", "subnet-fghi345a"]

  worker_groups = [
    {
      instance_type = "m4.large"
      asg_max_size  = 5
    }
  ]
}