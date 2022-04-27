locals {  
  is_prod = contains( [var.environment] , "prod" )
  }

### A bucket will be created when the environemnt is prod
resource "aws_s3_bucket" "versioning_bucket" {

  count = local.is_prod  ? 1 : 0
  ########### the following count works#################
  #count = "${var.environment == "prod" ? 1 : 0 }"
 
  bucket = var.bucket-name
  acl    = "private"

  versioning {
    enabled = var.enbable_bucket_version
  }

   tags = {
    Name        = "My bucket1"
    Environment =  var. environment
  }
}

# S3 bucket encrytpiong rule
resource "aws_s3_bucket_server_side_encryption_configuration" "enable-sse" {
  bucket = aws_s3_bucket.versioning_bucket[0].bucket

  rule {
    apply_server_side_encryption_by_default {
      #kms_master_key_id = aws_kms_key.mykey.arn
      #sse_algorithm     = "aws:kms"
      sse_algorithm     = "AES256"
      
    }
  }
}