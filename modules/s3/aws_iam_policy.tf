resource "aws_iam_policy" "s3_full_access" {
  description = "Provides full access to bucket ${aws_s3_bucket.this.bucket}"
  name        = "${title(replace(var.name, "[^A-Za-z0-9]*", ""))}S3FullAccess"
  policy = jsonencode({
    Statement = [
      {
        Action = [
          "s3:*"
        ],
        Effect = "Allow"
        Resource = [
          "${aws_s3_bucket.this.arn}",
          "${aws_s3_bucket.this.arn}/*"
        ]
      }
    ]
    Version = "2012-10-17"
  })
}