terraform {
  backend "s3" {
    bucket = "oncdec-b23-terraform"
    key = "terraform.tfstate"
    region = "ap-southeast-1"
    profile = "tf-user"
    
  }
}
