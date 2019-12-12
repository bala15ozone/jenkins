variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "availability_zone" {
  type    = "list"
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable vpc_name {
  default = "WEL_NON_PROD"
}

variable "vpc_cidr" {
  default = "10.233.0.0/19"
}

variable "cidr_private" {
  type = "list"

  default = [
    "10.233.8.0/21",
    "10.233.16.0/21",
    "10.233.24.0/21",
  ]
}

variable "cidr_public" {
  type = "list"

  default = [
    "10.233.0.0/25",
    "10.233.0.128/25",
    "10.233.1.0/25",
  ]
}

#-------------------------------------------------
# Tags
#-------------------------------------------------
variable "global_tags" {
  description = "AWS tags that will be added to all resources managed herein"
  type        = "map"

  default = {
    "Project"     = "WEL"
    "AppID"       = "APP-1619"
    "AppName"     = "Wiley Efficient Learning"
    "GroupOwner"  = "David Levine"
    "Owner"       = "DevOps KL"
    "ManagedBy"   = "Terraform"
    "Function"    = "non-prod"
    "Environment" = "non-prod"
  }
}
