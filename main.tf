module "s3_bucket" {

  source                 = "./module/s3"
  environment            = var.environment
  enbable_bucket_version = false
  bucket-name            = var.bucket-name

}
