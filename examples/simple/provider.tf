provider "aws" {
  version                 = "> 2.14.0"
  region                  = "us-east-1"
  shared_credentials_file = pathexpand("~/.aws-exploratory/credentials")
  profile                 = "default"
}