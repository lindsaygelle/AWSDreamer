resource "aws_s3_bucket_acl" "this" {
  acl    = "private"
  bucket = aws_s3_bucket.this.bucket
}