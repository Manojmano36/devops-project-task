module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = ">= 20.0.0, < 21.0.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.27" # choose an EKS Kubernetes minor version available in your account
  subnets         = module.vpc.private_subnets

  # VPC: either supply module.vpc outputs or set create_vpc = true
  create_vpc = true
  vpc_cidr   = var.vpc_cidr
  public_subnets  = ["10.0.1.0/24","10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24","10.0.4.0/24"]

  node_groups = {
    ng-default = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_type    = "t3.medium"
      key_name         = "your-ssh-key" # optional
    }
  }

  manage_aws_auth = true

  # option: create OIDC provider for IRSA
  enable_irsa = true
}
