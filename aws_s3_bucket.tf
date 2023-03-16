resource "aws_s3_bucket" "s3" {
  bucket = "${var.name}-${var.region}-${var.account}"
}