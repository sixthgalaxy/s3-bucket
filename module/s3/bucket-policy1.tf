resource "aws_s3_bucket" "aws_logs_bucket" {
  bucket = aws_s3_bucket.versioning_bucket[0].id
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
      "Resource": "arn:aws:s3:::${var.bucket_name}/*",
      "Principal": {
        "AWS": [
          "${data.aws_elb_service_account.main.arn}"
        ]
      }
    }
  ]
}
POLICY
}