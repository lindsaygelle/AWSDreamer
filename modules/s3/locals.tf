locals {
  workspace = terraform.workspace != "default" ? terraform.workspace : "dev"
}