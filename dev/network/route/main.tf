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

data "terraform_remote_state" "nat" {
  backend = "s3"
  config = {
    bucket = "tf-state-20250625"
    key    = "dev/network/nat/terraform.tfstate"
    #path = "../dev/vpc/terraform.tfstate"
    region = "ap-northeast-2"
  }
}

module "route"{
    source = "../../../modules/network/route"
    pub_a_sub_id = data.terraform_remote_state.snet.outputs.pub_a_sub_id
    pub_c_sub_id = data.terraform_remote_state.snet.outputs.pub_c_sub_id
    pri01_a_sub_id = data.terraform_remote_state.snet.outputs.pri01_a_sub_id
    pri01_c_sub_id = data.terraform_remote_state.snet.outputs.pri01_c_sub_id
    pri02_a_sub_id = data.terraform_remote_state.snet.outputs.pri02_a_sub_id
    pri02_c_sub_id = data.terraform_remote_state.snet.outputs.pri02_c_sub_id
    pri03_a_sub_id = data.terraform_remote_state.snet.outputs.pri03_a_sub_id
    pri03_c_sub_id = data.terraform_remote_state.snet.outputs.pri03_c_sub_id
    nat_id = data.terraform_remote_state.nat.outputs.nat_id
    vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
    igw_id = data.terraform_remote_state.vpc.outputs.igw_id
}

