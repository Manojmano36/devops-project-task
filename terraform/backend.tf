terraform {
  backend "s3" {
    bucket = "my-terraform-state-devopsbucket-manojr"
    key    = "appscrip-assignment/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
  }
}
