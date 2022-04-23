locals {  
  is_prod = contains( [var.environment] , "prod" )
  }

### A bucket will be created when the environemnt is prod
resource "aws_s3_bucket" "versioning_bucket" {

  count = local.is_prod  ? 1 : 0
  ########### the following count works#################
  #count = "${var.environment == "prod" ? 1 : 0 }"
 
  bucket = "sixth-my-versioning-bucket"
  acl    = "private"

  versioning {
    enabled = var.enbable_bucket_version
  }

   tags = {
    Name        = "My bucket1"
    Environment =  var. environment
  }
}

# output "bucket1-name" {
#   value = aws_s3_bucket.versioning_bucket.id
# }