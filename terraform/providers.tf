provider "aws" {
  region = var.aws_region
  # credentials: prefer EC2 instance role or env vars; do NOT hardcode keys
}

provider "kubernetes" {
  host                   = aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks.token
  load_config_file       = false
}

data "aws_eks_cluster_auth" "eks" {
  name = aws_eks_cluster.eks.name
}
