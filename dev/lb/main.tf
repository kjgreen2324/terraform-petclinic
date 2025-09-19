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
data "terraform_remote_state" "snet" {
  backend = "s3"
  config = {
    bucket = "tf-state-20250625"
    key    = "dev/network/snet/terraform.tfstate"
    region = "ap-northeast-2"
  }
}
/*
data "terraform_remote_state" "acm" {
  backend = "s3"
  config = {
    bucket = "tf-state-20250625"
    key    = "dev/acm/terraform.tfstate"
    region = "ap-northeast-2"
  }
}
*/
data "terraform_remote_state" "sg" {
  backend = "s3"
  config = {
    bucket = "tf-state-20250625"
    key    = "dev/network/sg/terraform.tfstate"
    region = "ap-northeast-2"
  }
}



module "lb"{
    source = "../../modules/lb"
    vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
    pub_a_sub_id = data.terraform_remote_state.snet.outputs.pub_a_sub_id
    pub_c_sub_id = data.terraform_remote_state.snet.outputs.pub_c_sub_id
    #pri01_a_sub_id = data.terraform_remote_state.snet.outputs.pri01_a_sub_id
    #pri01_c_sub_id = data.terraform_remote_state.snet.outputs.pri01_c_sub_id
    pri02_a_sub_id = data.terraform_remote_state.snet.outputs.pri02_a_sub_id
    pri02_c_sub_id = data.terraform_remote_state.snet.outputs.pri02_c_sub_id
    sg_alb_id = data.terraform_remote_state.sg.outputs.sg_alb_id
    sg_nlb_id = data.terraform_remote_state.sg.outputs.sg_nlb_id
    #certificate_arn= data.terraform_remote_state.acm.outputs.certificate_arn
}

