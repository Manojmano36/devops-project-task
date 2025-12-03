variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "cluster_name" {
  type    = string
  default = "appscrip-eks-demo"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

# add other variables like node_count, instance_type, etc.
