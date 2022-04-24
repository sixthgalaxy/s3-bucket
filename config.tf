terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket         = "sixth-tf-dev-s3"
    key            = "env/dev/s3.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "dev-s3-config-statelock"
  }


}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1"
}