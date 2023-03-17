resource "aws_s3_bucket" "this" {
  bucket = "${var.account}-${var.region}-${var.name}"
  tags = {
    application = "${var.name}"
    region      = "${var.region}"
    workspace   = "${local.workspace}"
  }
}

output "arn" {
  value = aws_s3_bucket.this.arn
}

output "bucket" {
  value = aws_s3_bucket.this.bucket
}