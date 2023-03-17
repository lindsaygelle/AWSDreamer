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
  tags = {
    application = "${var.name}"
    region      = "${var.region}"
    workspace   = "${local.workspace}"
  }
}

resource "aws_iam_policy" "s3_put_object_only" {
  description = "Provides only s3:PutObject access to bucket ${aws_s3_bucket.this.bucket}"
  name        = "${title(replace(var.name, "[^A-Za-z0-9]*", ""))}S3PutObjectOnlyAccess"
  policy = jsonencode({
    Statement = [
      {
        Action = [
          "s3:PutObject"
        ],
        Effect = "Allow"
        Resource = [
          "${aws_s3_bucket.this.arn}/*"
        ]
      }
    ]
    Version = "2012-10-17"
  })
  tags = {
    application = "${var.name}"
    region      = "${var.region}"
    workspace   = "${local.workspace}"
  }
}

resource "aws_iam_policy" "s3_read_only" {
  description = "Provides read only access to bucket ${aws_s3_bucket.this.bucket}"
  name        = "${title(replace(var.name, "[^A-Za-z0-9]*", ""))}S3ReadOnlyAccess"
  policy = jsonencode({
    Statement = [
      {
        Action = [
          "s3:Get*",
          "s3:List*",
          "s3-object-lambda:Get*",
          "s3-object-lambda:List*"
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
  tags = {
    application = "${var.name}"
    region      = "${var.region}"
    workspace   = "${local.workspace}"
  }
}