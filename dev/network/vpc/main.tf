terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = "ap-northeast-2"
}



module "vpc"{
    source = "../../../modules/network/vpc"
    vpc_cidr_block = "10.0.0.0/16"
}

