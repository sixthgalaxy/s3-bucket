terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket         = "sixth-dev-tf-backend"
    key            = "env/dev/s3.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "dev-s3-config-statelock"
  }

}
# the partion key name of the DynamoDB should be LockID

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1"
}