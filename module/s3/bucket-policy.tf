# resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
#   bucket = aws_s3_bucket.versioning_bucket[0].id
#   policy = data.aws_iam_policy_document.allow_access_from_another_account.json
# }
resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.versioning_bucket[0].id
  policy = <<POLICY

  {
  "Id": "HTTPSPolicy",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowSSLRequestsOnly",
      "Action": "s3:*",
      "Effect": "Deny",
      "Resource": [
        "aws_s3_bucket.versioning_bucket[0].arn",
        "aws_s3_bucket.versioning_bucket[0].arn/*"
      ],
      "Condition": {
        "Bool": {
          "aws:SecureTransport": "false"
        }
      },
      "Principal": "arn:aws:iam::607281769355:root"
    }
  ]
}

 POLICY
}

# data "aws_iam_policy_document" "allow_access_from_another_account" {
#   statement {
#     principals {
#       type        = "AWS"
#       identifiers = ["arn:aws:iam::607281769355:root"]
#     }

#     actions = [
#       "s3:GetObject",
#       "s3:ListBucket",
#     ]

#     resources = [
#       aws_s3_bucket.versioning_bucket[0].arn,
#       "${aws_s3_bucket.versioning_bucket[0].arn}/*",
#     ]
#        condition {
#       test     = "Bool"
#       variable = "aws:SecureTransport"

#       values = [
#         "false"    
#       ]
#     }
      




#   }
# }
