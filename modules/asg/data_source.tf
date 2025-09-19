data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "^al2023-"
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-kernel-6.1-x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
data "aws_ami" "tomcat" {
  most_recent = true
  #name_regex  = "^al2023-"
  owners      = ["396350191448"]

  filter {
    name   = "name"
    values = ["tomcat"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "aws_ami" "apache" {
  most_recent = true
  #name_regex  = "^al2023-"
  owners      = ["396350191448"]

  filter {
    name   = "name"
    values = ["apache"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}