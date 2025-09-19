variable "apache_instance_type" {
  description = "The instance_type."
  default = "t3.micro"
  type        = string
}

variable "tomcat_instance_type" {
  description = "The instance_type."
  default = "t3.medium"
  type        = string
}


variable "asg-min_size" {
  description = "asg-min_size."
  type        = string
}

variable "asg-max_size" {
  description = "asg-max_size."
  type        = string
}

variable "desired_capacity" {
  description = "desired_capacity."
  type        = string
}

variable "vpc_id" {
  type = string
}

variable "pub_a_sub_id" {
  type = string
}
variable "pub_c_sub_id" {
  type = string
}

variable "pri01_a_sub_id" {
  type = string
}

variable "pri01_c_sub_id" {
  type = string
}

variable "pri02_a_sub_id" {
  type = string
}

variable "pri02_c_sub_id" {
  type = string
}


variable "sg_alb_id" {
  type = string
}
variable "sg_web_id" {
  type = string
}
variable "sg_was_id" {
  type = string
}
variable "alb_target_group_arn" {
  type = string
}

variable "nlb_target_group_arn" {
  type = string
}

variable "nlb_dns_name" {
  type = string
}