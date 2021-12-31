provider "aws" {
  region = "us-west-2"
}

terraform {
  backend "s3" {
    bucket         = "terraform-remote-state-evrhiness-project"
    dynamodb_table = "terraform-state-lock-evrhiness-lock"
    region         = "us-west-2"
    key            = "kops/terraform.tfstate"
  }
}