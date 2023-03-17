module "s3" {
  account = var.account
  name    = var.name
  region  = var.region
  source  = "../../modules/s3"
}