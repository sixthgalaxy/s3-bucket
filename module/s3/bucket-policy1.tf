resource "aws_s3_bucket" "aws_logs_bucket" {
  bucket = var.bucket-name
  # bucket = aws_s3_bucket.versioning_bucket[0].id
  acl    = "private"
  versioning {
    enabled = true
  }
  policy = <<POLICY
{
  "Id": "Policy",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:PutObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${var.bucket-name}/*",
    
      "Principal": {
        "AWS": [
          "arn:aws:iam::607281769355:root"
        ]
      }
    },
   {
      "Action": [
        "s3:PutObject"
      ],
      "Effect": "Deny",
      "Resource": "arn:aws:s3:::${var.bucket-name}/*",
       "Condition": {
        "Bool": {
          "aws:SecureTransport": "false"
        }
      },
      "Principal": {
        "AWS": [
          "arn:aws:iam::607281769355:root"
        ]
      }
    }




  ]
}
POLICY
}