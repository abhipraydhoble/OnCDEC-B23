terraform {
  backend "s3" {
    bucket = "oncdec-b23-terraform" # Replace with your actual S3 bucket name
    key    = "EKS/terraform.tfstate"
    region = "ap-southeast-1"
    profile = "eks"
  }
}
