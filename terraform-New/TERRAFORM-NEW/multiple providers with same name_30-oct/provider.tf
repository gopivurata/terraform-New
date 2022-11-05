
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the multiple AWS Providers
provider "aws" {
  region = "us-west-2"
  alias = "first"
}

provider "aws" {
  region = "ap-south-1"
  alias = "second"
}

