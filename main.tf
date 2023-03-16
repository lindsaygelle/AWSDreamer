provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    key = "dreamer/terraform.tfstate"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.57.1"
    }
  }
}
