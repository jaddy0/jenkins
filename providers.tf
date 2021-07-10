provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-statefile2021"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
