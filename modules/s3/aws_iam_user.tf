resource "aws_iam_user" "s3_admin" {
  name = "${title(replace(var.name, "[^A-Za-z0-9]*", ""))}UserS3FullAccess"
  path = "/${var.name}/"
  tags = {
    application = "${var.name}"
    region      = "${var.region}"
    workspace   = "${local.workspace}"
  }
}