
#---------------------------SUB-------------------------------

resource "aws_subnet" "pub_a" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.pub_a_sub_cidr_block
  availability_zone       = "ap-northeast-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "tf-subnet-public-ap-northeast-2a"
  }
}

resource "aws_subnet" "pub_c" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.pub_c_sub_cidr_block
  availability_zone       = "ap-northeast-2c"
  map_public_ip_on_launch = true
  tags = {
    Name = "tf-subnet-public-ap-northeast-2c"
  }
}
resource "aws_subnet" "pri01_a" {
  vpc_id            = var.vpc_id
  cidr_block        = var.pri01_a_sub_cidr_block
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "tf-subnet-private01-ap-northeast-2a"
  }
}

resource "aws_subnet" "pri01_c" {
  vpc_id            = var.vpc_id
  cidr_block        = var.pri01_c_sub_cidr_block
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "tf-subnet-private01-ap-northeast-2c"
  }
}

resource "aws_subnet" "pri02_a" {
  vpc_id            = var.vpc_id
  cidr_block        = var.pri02_a_sub_cidr_block
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "tf-subnet-private02-ap-northeast-2a"
  }
}

resource "aws_subnet" "pri02_c" {
  vpc_id            = var.vpc_id
  cidr_block        = var.pri02_c_sub_cidr_block
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "tf-subnet-private02-ap-northeast-2c"
  }
}
resource "aws_subnet" "pri03_a" {
  vpc_id            = var.vpc_id
  cidr_block        = var.pri03_a_sub_cidr_block
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "tf-subnet-private03-ap-northeast-2a"
  }
}

resource "aws_subnet" "pri03_c" {
  vpc_id            = var.vpc_id
  cidr_block        = var.pri03_c_sub_cidr_block
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "tf-subnet-private03-ap-northeast-2c"
  }
}


#-----------------------------DB-------------------------------

resource "aws_db_subnet_group" "tf-db" {
  name       = "db-snet"
  subnet_ids = [aws_subnet.pri03_a.id,aws_subnet.pri03_c.id]

  tags = {
    Name = "Terraform DB subnet group"
  }
}