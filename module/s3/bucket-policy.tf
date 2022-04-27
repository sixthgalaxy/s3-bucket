resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.versioning_bucket[0].id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}

data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::607281769355:root"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.versioning_bucket[0].arn,
      "${aws_s3_bucket.versioning_bucket[0].arn}/*",
    ]
       condition {
      test     = "Bool"
      variable = "aws:SecureTransport"

      values = [
        "false"    
      ]
    }
  }
}
