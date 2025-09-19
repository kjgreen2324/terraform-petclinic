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
data "terraform_remote_state" "sg" {
  backend = "s3"
  config = {
    bucket = "tf-state-20250625"
    key    = "dev/network/sg/terraform.tfstate"
    #path = "../dev/asg/terraform.tfstate"
    region = "ap-northeast-2"
  }
}
data "terraform_remote_state" "lb" {
  backend = "s3"
  config = {
    bucket = "tf-state-20250625"
    key    = "dev/lb/terraform.tfstate"
    #path = "../dev/asg/terraform.tfstate"
    region = "ap-northeast-2"
  }
}


module "asg"{
    source = "../../modules/asg"
    asg-min_size = "2"
    asg-max_size = "4"
    desired_capacity = "0"
    vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
    pub_a_sub_id = data.terraform_remote_state.snet.outputs.pub_a_sub_id
    pub_c_sub_id = data.terraform_remote_state.snet.outputs.pub_c_sub_id
    pri01_a_sub_id = data.terraform_remote_state.snet.outputs.pri01_a_sub_id
    pri01_c_sub_id = data.terraform_remote_state.snet.outputs.pri01_c_sub_id
    pri02_a_sub_id = data.terraform_remote_state.snet.outputs.pri02_a_sub_id
    pri02_c_sub_id = data.terraform_remote_state.snet.outputs.pri02_c_sub_id
    sg_alb_id = data.terraform_remote_state.sg.outputs.sg_alb_id
    sg_web_id = data.terraform_remote_state.sg.outputs.sg_alb_id
    sg_was_id = data.terraform_remote_state.sg.outputs.sg_was_id
    alb_target_group_arn = data.terraform_remote_state.lb.outputs.alb_target_group_arn
    nlb_target_group_arn = data.terraform_remote_state.lb.outputs.nlb_target_group_arn
    nlb_dns_name = data.terraform_remote_state.lb.outputs.nlb_dns_name
}