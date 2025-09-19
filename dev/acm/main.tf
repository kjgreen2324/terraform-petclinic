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

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "tf-state-20250625"
    key    = "dev/network/vpc/terraform.tfstate"
    region = "ap-northeast-2"
  }
}


data "terraform_remote_state" "lb" {
  backend = "s3"
  config = {
    bucket = "tf-state-20250625"
    key    = "dev/lb/terraform.tfstate"
    region = "ap-northeast-2"
  }
}

module "acm"{
  source = "../../modules/acm"
  certificate_arn = module.acm.certificate_arn
  alb_zone_id = data.terraform_remote_state.lb.outputs.alb_zone_id
  alb_dns_name = data.terraform_remote_state.lb.outputs.alb_dns_name
}

