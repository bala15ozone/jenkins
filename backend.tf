terraform {
  backend "s3" {
    bucket = "terraform-state-wiley-dev-us-east-1-wiley-com"
    key    = "non-prod/wel/vpc/terraform.tfstate"

    region  = "us-east-1"
    encrypt = true
  }
}

data "terraform_remote_state" "network" {
  backend = "s3"

  config {
    bucket = "terraform-state-wiley-dev-us-east-1-wiley-com"
    key    = "non-prod/wel/vpc/terraform.tfstate"

    region = "us-east-1"
  }
}
