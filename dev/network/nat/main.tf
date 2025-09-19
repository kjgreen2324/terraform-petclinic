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
    #path = "../dev/vpc/terraform.tfstate"
    region = "ap-northeast-2"
  }
}


data "terraform_remote_state" "snet" {
  backend = "s3"
  config = {
    bucket = "tf-state-20250625"
    key    = "dev/network/snet/terraform.tfstate"
    #path = "../dev/vpc/terraform.tfstate"
    region = "ap-northeast-2"
  }
}

module "nat" {
  source = "../../../modules/network/nat"
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  pub_a_sub_id = data.terraform_remote_state.snet.outputs.pub_a_sub_id
  igw_id = data.terraform_remote_state.vpc.outputs.igw_id
}