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


module "snet"{
    source = "../../../modules/network/snet"
    pub_a_sub_cidr_block = "10.0.0.0/24"
    pub_c_sub_cidr_block = "10.0.4.0/24"
    pri01_a_sub_cidr_block = "10.0.1.0/24"
    pri01_c_sub_cidr_block = "10.0.5.0/24"
    pri02_a_sub_cidr_block = "10.0.2.0/24"
    pri02_c_sub_cidr_block = "10.0.6.0/24"
    pri03_a_sub_cidr_block = "10.0.3.0/24"
    pri03_c_sub_cidr_block = "10.0.7.0/24"
    vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
}

