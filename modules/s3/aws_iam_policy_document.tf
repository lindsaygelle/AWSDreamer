data "aws_iam_policy_document" "s3_bucket" {
  statement {
    actions = [
      "s3:*"
    ]

    principals {
      identifiers = [
        var.account
      ]
      type = "AWS"
    }

    resources = [
      "${aws_s3_bucket.this.arn}",
      "${aws_s3_bucket.this.arn}/*",
    ]
  }
}