module "s3_bucket" {

  source                 = "./module/s3"
  environment            = var.environment
  enbable_bucket_version = false
  bucket-name            = var.bucket-name

}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  required_version = ">= 0.14"
  backend "s3" {
    bucket         = "sixth-tf-dev-s3"
    key            = "env/dev/s3.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "dev-s3-config-statelock"
  }
}